part of '../../../../../features/tags_manager/presentation/bloc/tags_bloc.dart';

@immutable
abstract class TagsEvent extends Equatable {}

final class TagsDisplayed extends TagsEvent {
  @override
  List<Object?> get props => [];
}