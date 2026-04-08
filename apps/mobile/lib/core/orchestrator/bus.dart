import 'package:event_bus/event_bus.dart';

import 'events.dart';

abstract class Bus {
  void fire<T extends BusEvent>(T event);
  void on<T extends BusEvent>(void Function(T event) onEvent);
}

class BusImpl extends Bus {
  BusImpl(this._eventBus);

  final EventBus _eventBus;

  @override
  void fire<T extends BusEvent>(T event) {
    _eventBus.fire(event);
  }

  @override
  void on<T extends BusEvent>(void Function(T event) onEvent) {
    _eventBus.on<T>().listen(onEvent);
  }
}
