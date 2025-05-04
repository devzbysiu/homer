import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

final class ExternalBookInfo extends Equatable {
  const ExternalBookInfo({required this.isbn, required this.title});

  final String title;

  final Option<String> isbn;

  ExternalBookInfo copyWith({String? title, Option<String>? isbn}) {
    return ExternalBookInfo(
      title: title ?? this.title,
      isbn: isbn ?? this.isbn,
    );
  }

  @override
  List<Object> get props => [title, isbn];
}
