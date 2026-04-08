import 'package:homer/core/error/failures.dart';

final class TestingFailure implements Failure {
  @override
  String userMessage() => 'This is test failure';
}
