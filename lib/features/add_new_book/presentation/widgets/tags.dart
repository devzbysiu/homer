import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/color_mapper.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../../tags_manager/presentation/bloc/tags_bloc.dart';
import '../bloc/on_book_tags_bloc.dart';

final class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

final class _TagsState extends State<Tags> {
  final Set<int> _selectedTagIndices = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagsBloc, TagsState>(
      builder: (context, state) {
        final tags = state.tags;
        return ChipList(
          supportsMultiSelect: true,
          listOfChipNames: tags.map((tag) => tag.name).toList(),
          extraOnToggle: (idx) => _tagSelected(context, idx, tags),
          listOfChipIndicesCurrentlySeclected: _selectedTagIndices.toList(),
          inactiveBgColorList: _inactiveColors(context, tags),
          inactiveBorderColorList: _tagColors(tags),
          inactiveTextColorList: _inactiveText(context, tags),
          activeBgColorList: _tagColors(tags),
          activeTextColorList: _whiteColors(tags),
        );
      },
    );
  }

  List<Color> _tagColors(List<Tag> tags) {
    return tags.map((tag) => toFlutterColor(tag.color)).toList();
  }

  List<Color> _inactiveText(BuildContext context, List<Tag> tags) {
    return tags.map((_) => Theme.of(context).colorScheme.onBackground).toList();
  }

  List<Color> _whiteColors(List<Tag> tags) {
    return tags.map((_) => Colors.white).toList();
  }

  void _tagSelected(BuildContext context, int idx, List<Tag> tags) {
    if (_selectedTagIndices.contains(idx)) {
      context.deselectTag(tags[idx]);
      _selectedTagIndices.remove(idx);
    } else {
      context.selectTag(tags[idx]);
      _selectedTagIndices.add(idx);
    }
    setState(() {});
  }

  List<Color> _inactiveColors(BuildContext context, List<Tag> tags) {
    return tags.map((_) => Theme.of(context).colorScheme.background).toList();
  }
}
