part of '../../../../../features/tags_manager/presentation/bloc/tags_bloc.dart';

@immutable
abstract class TagsEvent {}

final class TagsDisplayed extends TagsEvent {}