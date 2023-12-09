import 'package:equatable/equatable.dart';

class ExternalBookInfo extends Equatable {
  const ExternalBookInfo({
    required this.isbn,
    required this.title,
  });

  final String title;

  final String isbn;

  @override
  List<Object> get props => [title, isbn];
}
