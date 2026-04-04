# Homer

A clean, personal book manager built with Flutter. Track books you want
to read, are currently reading, and have finished — with reading
statistics, tag management, and import/export support.

---

## Table of Contents

- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Architecture](#architecture)
  - [Clean Architecture Layers](#clean-architecture-layers)
  - [Dependency Injection](#dependency-injection)
  - [Startup Flow](#startup-flow)
- [Feature Modules](#feature-modules)
- [Event System](#event-system)
  - [Bus](#bus)
  - [BusEvents](#busevents)
  - [Orchestrator](#orchestrator)
  - [Event Flow Diagrams](#event-flow-diagrams)
- [State Management (BLoC)](#state-management-bloc)
- [Data Layer](#data-layer)
- [Navigation](#navigation)
- [Theming](#theming)
- [Getting Started](#getting-started)

---

## Technology Stack

| Category                | Library                            |
|-------------------------|------------------------------------|
| Framework               | Flutter / Dart                     |
| State management        | flutter_bloc                       |
| Cross-feature events    | event_bus                          |
| Dependency injection    | get_it                             |
| Navigation              | go_router                          |
| Local database          | drift (SQLite ORM)                 |
| Key-value storage       | shared_preferences                 |
| Book search API         | books_finder                       |
| Immutable value objects | freezed                            |
| JSON serialization      | json_serializable                  |
| Functional types        | dartz, multiple_result             |
| Theming                 | flex_color_scheme, theme_tailor    |
| Charts                  | fl_chart                           |
| Logging                 | talker_flutter, talker_bloc_logger |

---

## Project Structure

```
lib/
├── envs/
│   ├── dev.dart               # Development entry point
│   └── prod.dart              # Production entry point
├── run.dart                   # App initialization & BLoC wiring
├── app.dart                   # Root MaterialApp.router widget
├── app_config.dart            # Environment config model
├── router.dart                # GoRouter route definitions
├── injection_container.dart   # GetIt DI registrations
├── logger.dart                # Talker logger setup
│
├── core/
│   ├── entities/              # Shared domain entities (Book, Tag)
│   ├── error/                 # Exceptions & Failure types
│   ├── orchestrator/          # Central event bus & routing
│   │   ├── bus.dart           # Bus interface + BusImpl
│   │   ├── events.dart        # BusEvent sealed class (all app events)
│   │   ├── event_mappers.dart # BusEvent → BLoC Event conversions
│   │   ├── orchestrator.dart  # Event router (subscribes & dispatches)
│   │   └── bus_widget.dart    # Widget helpers with fire()
│   ├── theme/                 # Material Design theme system
│   ├── usecase/               # Abstract UseCase<T, Params>
│   ├── utils/                 # Extensions & shared helpers
│   └── widgets/               # Reusable UI components
│
└── features/
    ├── manage_books/          # Book listing, swipe, delete
    ├── find_new_book/         # External search & share handler
    ├── settings/              # User preferences
    ├── stats/                 # Reading statistics
    ├── import_export/         # JSON backup & restore
    └── tags_manager/          # Tag CRUD (in-memory)

assets/
└── config/
    ├── dev.json               # Dev API base URL
    └── prod.json              # Prod API base URL
```

---

## Architecture

Homer follows **Clean Architecture** organized by feature. Each feature
owns its own `data/`, `domain/`, and `presentation/` layers with strict
directional dependencies.

```
Presentation (BLoC + Widgets)
        ↓
    Domain (UseCases + Repository interfaces + Entities)
        ↓
    Data (Repository implementations + DataSources + DTOs)
```

### Clean Architecture Layers

#### Data layer

- `DataSource` classes talk directly to SQLite (Drift),
  SharedPreferences, external HTTP APIs, or the filesystem.
- `DTO` classes represent the on-wire / on-disk format and are mapped
  to domain entities by the repository.
- Repository implementations catch exceptions from data sources and
  return `Result<T, Failure>` so failures never propagate as exceptions
  above this layer.

#### Domain layer

- `Entity` classes are immutable Freezed value objects
  (e.g., `Book`, `Tag`).
- `Repository` interfaces declare the contract without any
  implementation detail.
- `UseCase` classes each own one piece of business logic. They accept
  typed `Params` and return `Result<T, Failure>`.

#### Presentation layer

- `BLoC` classes receive typed events, call use cases, and emit
  typed states.
- `Page` / `Widget` classes only call
  `context.read<XBloc>().add(...)` or the `fire()` bus helper —
  never use cases or repositories directly.

### Dependency Injection

All registrations live in `injection_container.dart` and use **GetIt**
as a service locator. The DI graph is built once at startup in this
order:

1. `AppConfig` loaded from `assets/config/<env>.json`
2. `Bus` singleton (wraps `EventBus`)
3. DataSources (Drift, SharedPreferences, HTTP, filesystem)
4. Repositories (bind interfaces to implementations)
5. UseCases
6. BLoCs
7. `Orchestrator` singleton (registered last; all BLoCs must exist)

### Startup Flow

```
envs/dev.dart or envs/prod.dart
    └── main() → run(env: Env.dev | Env.prod)
            ├── WidgetsFlutterBinding.ensureInitialized()
            ├── Set BlocObserver → TalkerBlocObserver
            ├── Set system UI (transparent bar, portrait lock)
            ├── await initDi(env)       ← builds the full DI graph
            └── runApp(
                  MultiBlocProvider(blocs: [...11 BLoCs...],
                    child: Homer()))
```

---

## Feature Modules

**`manage_books`** — List, filter, swipe-to-advance, and delete books.
BLoCs: `BooksBloc`, `AppTabBloc`, `BookSummaryBloc`, `DeleteBooksBloc`

**`find_new_book`** — Search external API, pick a suggestion, handle
OS share intents.
BLoCs: `BookSearchBloc`, `ShareBookBloc`, `OnBookTagsBloc`

**`settings`** — Theme, book size limits, reading goal.
BLoC: `SettingsBloc`

**`stats`** — Books finished per year/month, currently reading count.
BLoC: `StatsBloc`

**`import_export`** — Export to / import from JSON file.
BLoC: `ImportExportBloc`

**`tags_manager`** — Create and toggle tags on books.
BLoC: `TagsBloc` (in-memory repo)

---

## Event System

Cross-feature communication is the most distinctive part of Homer's
architecture. Instead of BLoCs holding references to each other, all
cross-cutting interactions are mediated through a **central event bus**
following a pub/sub pattern.

```
Widget
  │  fires BusEvent via fire()
  ▼
Bus (EventBus wrapper)
  │  broadcasts to all subscribers
  ▼
Orchestrator (single subscriber for every event type)
  │  maps BusEvent → BLoC Event via extension .into()
  ▼
Target BLoC(s).add(...)
  │  processes event, emits new State
  ▼
Widgets rebuild via BlocBuilder / BlocListener
```

### Bus

`Bus` is a thin abstraction over the `event_bus` package:

```dart
// core/orchestrator/bus.dart
abstract class Bus {
  void fire(BusEvent event);
  Stream<T> on<T extends BusEvent>();
}

class BusImpl implements Bus {
  final EventBus _eventBus = EventBus();
  void fire(BusEvent event) => _eventBus.fire(event);
  Stream<T> on<T extends BusEvent>() => _eventBus.on<T>();
}
```

Widgets access it through the `BusWidget` mixin or the standalone
`fire()` helper, keeping widget code free of BLoC references.

### BusEvents

All events are defined as a **Freezed sealed class** in
`core/orchestrator/events.dart`. Every factory constructor is a
distinct event type prefixed with `$`:

#### Navigation

- `$TabChanged(selectedTab)`

#### Import / Export

- `$ImportTriggered(path)`, `$ImportFinished`, `$ExportTriggered(path)`

#### Find new book

- `$Searching(query)`, `$ShareOffloaded(query)`, `$ResetShareOffload`
- `$SuggestionPicked(pickedBook)`
- `$SaveBook(book, bookState, selectedTags)`

#### Delete

- `$DeleteModeToggled(book)`, `$ClearDeletionList`
- `$DeletePickedBooks`, `$DeleteBooksFinished`

#### Listing

- `$BooksFiltered(query)`, `$TagToggled(book, tag)`
- `$BookSwiped(book, dir)`

#### Book summary

- `$SummaryModeToggled(book)`, `$SummaryModeClosing`, `$SummaryModeClosed`

#### Settings

- `$ThemeToggled`, `$SystemThemeToggled`
- `$SizeLimitsChanged(limits)`, `$ReadingGoalChanged(goal)`

#### Stats

- `$BookFinished(updatedBook)`, `$BookStarted`
- `$BookUnfinished(book)`, `$BookUnstarted`

#### Share (OS intent)

- `$BookSharedFromOutside(url)`, `$ClearSharedBook`

Each `BusEvent` subtype has a corresponding `.into()` extension method
in `event_mappers.dart` that converts it to the correct BLoC event
type, keeping the `Orchestrator` free of mapping logic.

### Orchestrator

`Orchestrator` is a singleton registered in DI. Its constructor
subscribes to every `BusEvent` type and holds references to all 11
BLoCs. When an event arrives it calls the appropriate BLoC(s):

```dart
// Simplified excerpt from orchestrator.dart
final class Orchestrator {
  Orchestrator({required Bus eventBus, required BooksBloc books, ...}) {
    eventBus.on<$SaveBook>(_onSaveBook);
    eventBus.on<$DeleteBooksFinished>(_onDeleteBooksFinished);
    // ...all 26 subscriptions
  }

  // Fan-out: one bus event triggers multiple BLoCs
  void _onSaveBook($SaveBook e) {
    books.add(e.into());           // persist the book
    search.add(ClearPickedBook()); // reset search state
    share.add(ClearSharedBook());  // reset share state
    onBookTags.add(ClearSelectedTags()); // reset tag state
  }

  // Fan-out: finished import refreshes both lists and stats
  void _onImportFinished($ImportFinished _) {
    stats.add(LoadStats());
    books.add(RefreshBooksList());
  }
}
```

The Orchestrator is the **only** place in the app where a BLoC may
affect another BLoC. Features themselves remain decoupled.

### Event Flow Diagrams

#### Saving a new book (from search)

```text
SearchPage taps "Save"
    │ fire($SaveBook(book, state, tags))
    ▼
Bus → Orchestrator._onSaveBook()
    ├── BooksBloc.add(SaveBook)
    │       └── AddBook use case → Drift DB
    │               └── emit BooksState.booksLoaded(...)
    ├── BookSearchBloc.add(ClearPickedBook)
    ├── ShareBookBloc.add(ClearSharedBook)
    └── OnBookTagsBloc.add(ClearSelectedTags)
```

#### Swiping a book (state transition + stats side-effect)

```text
BookCard swipe gesture
    │ fire($BookSwiped(book, direction))
    ▼
Bus → Orchestrator._onSwiped()
    └── BooksBloc.add(BookSwiped)
            └── UpdateBook use case → Drift DB
                    ├── emit updated BooksState
                    └── [if readLater→reading]  fire($BookStarted)
                        [if reading→read]       fire($BookFinished(book))
                        [if read→reading]       fire($BookUnfinished(book))
                        [if reading→readLater]  fire($BookUnstarted)
                            ▼
                        Bus → Orchestrator._onBookFinished() etc.
                            └── StatsBloc.add(BookFinished | ...)
                                    └── LoadStats use case
                                        └── emit StatsState.loaded(...)
```

#### Sharing a book from an external app (OS intent)

```txt
OS share intent received
    │ fire($BookSharedFromOutside(url))
    ▼
Bus → Orchestrator._onBookSharedFromOutside()
    └── ShareBookBloc.add(BookSharedFromOutside)
            └── FetchSharedBookInfo use case (HTTP scrape)
                    ├── [ISBN found]
                    │   └── emit ShareBookState.bookLookedUp(book)
                    │       → UI shows "save" bottom sheet
                    └── [no ISBN]
                            └── fire($ShareOffloaded(title))
                                    ▼
                                Bus → Orchestrator._onShareOffloaded()
                                    └── BookSearchBloc.add(ShareOffloaded)
                                        └── pre-fill search bar with title
```

#### Import finished (cross-BLoC refresh)

```txt
ImportExportBloc finishes import
    │ fire($ImportFinished)
    ▼
Bus → Orchestrator._onImportFinished()
    ├── StatsBloc.add(LoadStats)        ← re-compute statistics
    └── BooksBloc.add(RefreshBooksList) ← reload book list from DB
```

---

## State Management (BLoC)

Each feature's BLoC follows this structure:

```dart
final class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({required this.listSortedBooks, ...})
      : super(BooksState.initial()) {
    on<RefreshBooksList>(_onRefresh);
    on<SaveBook>(_onSave);
    on<BookSwiped>(_onSwiped);
    // ...
  }

  Future<void> _onSave(SaveBook e, Emitter<BooksState> emit) async {
    final result = await addBook(AddParams(book: e.book, ...));
    result.when(
      (unit)    => emit(BooksState.booksLoaded(books: await _reload())),
      (failure) => emit(BooksState.error()),
    );
  }
}
```

States are **Freezed sealed classes** with named constructors (e.g.,
`initial`, `loading`, `booksLoaded`, `error`), making exhaustive
pattern matching possible in the UI.

The 11 registered BLoCs and their responsibilities:

| BLoC               | Responsibility                             |
|--------------------|--------------------------------------------|
| `AppTabBloc`       | Active tab (readLater / reading / read)    |
| `BooksBloc`        | Main book list, filtering, swiping, saving |
| `BookSummaryBloc`  | Detail panel open/close state              |
| `BookSearchBloc`   | External book search results               |
| `ShareBookBloc`    | OS share intent lifecycle                  |
| `OnBookTagsBloc`   | Tag selection during book creation         |
| `DeleteBooksBloc`  | Multi-select delete mode                   |
| `TagsBloc`         | Available tags                             |
| `SettingsBloc`     | Theme, size limits, reading goal           |
| `StatsBloc`        | Reading statistics                         |
| `ImportExportBloc` | File import / export operations            |

---

## Data Layer

### Persistence

| Storage           | Used for                            |
|-------------------|-------------------------------------|
| Drift (SQLite)    | Books (all fields + state + tags)   |
| SharedPreferences | User settings (theme, limits, goal) |
| JSON file         | Import / export snapshots           |

The `BookDTO` Drift table is the canonical on-disk format. `BooksRepo`
maps `BookDTO ↔ Book` (domain entity) on every read/write.

### External Data

- **`books_finder`** — searches Google Books by query string; returns
  an `ExternalBookDTO` list.
- **HTTP scraper** — fetches book info (including ISBN) from a
  configurable URL (`AppConfig.bookInfoUrl`) when a URL is shared
  from the OS.

### Error Handling

```
DataSource throws Exception
    ↓ caught in Repository
Repository logs via Talker
    ↓
Repository returns Error(Failure)
    ↓ .when() in BLoC
BLoC emits ErrorState
    ↓
Widget shows snackbar / error UI
```

No exceptions propagate above the repository layer.

---

## Navigation

GoRouter defines four routes:

| Route            | Widget              | Notes                          |
|------------------|---------------------|--------------------------------|
| `/splash`        | `SplashScreen`      | Initial route while DI settles |
| `/home`          | Home + `BottomBar`  | Default after splash           |
| `/home/settings` | `SettingsPage`      | Pushed from home               |
| `/home/stats`    | `StatsPage`         | Pushed from home               |
| `/home/logs`     | Talker log viewer   | Dev/debug only                 |

Navigation between the three book-state tabs (read-later, reading,
read) is handled by `AppTabBloc` through the event bus (`$TabChanged`)
— not by GoRouter — since it is a tab switch within the same screen,
not a route change.

---

## Theming

- **`flex_color_scheme`** generates the `ThemeData` from a seed color.
- **`theme_tailor`** generates typed extension classes for custom
  design tokens.
- **`dynamic_color`** enables Material You wallpaper-based color
  extraction on Android 12+.
- `SettingsBloc` holds the active theme mode (light / dark / system)
  and re-emits whenever `$ThemeToggled` or `$SystemThemeToggled`
  fires. The root `Homer` widget wraps a `BlocBuilder<SettingsBloc>`
  so the entire tree rebuilds on theme change.

---

## Getting Started

### Prerequisites

- Flutter SDK ≥ 3.8.0
- Dart ≥ 3.8.0

### Run

```bash
# Development flavor
flutter run --target lib/envs/dev.dart

# Production flavor
flutter run --target lib/envs/prod.dart
```

### Build

```bash
# Android APK (production)
flutter build apk --target lib/envs/prod.dart

# iOS (production)
flutter build ios --target lib/envs/prod.dart
```

### Code Generation

Freezed, Drift, and JSON serialization use `build_runner`:

```bash
dart run build_runner build --delete-conflicting-outputs
```
