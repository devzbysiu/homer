import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/color_mapper.dart';
import '../../../../core/utils/extensions.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../bloc/book_tags_bloc.dart';

final class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

final class _TagsState extends State<Tags> {
  final Set<int> _selectedTags = {};

  @override
  Widget build(BuildContext context) {
    final tags = context.allTags();
    return ChipList(
      supportsMultiSelect: true,
      listOfChipNames: tags.map((tag) => tag.name).toList(),
      extraOnToggle: (idx) => _tagSelected(context, idx, tags),
      listOfChipIndicesCurrentlySeclected: _selectedTags.toList(),
      inactiveBgColorList: _inactiveColors(context, tags),
      inactiveBorderColorList: _tagColors(tags),
      inactiveTextColorList: _inactiveText(context, tags),
      activeBgColorList: _tagColors(tags),
      activeTextColorList: _whiteColors(tags),
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
    if (_selectedTags.contains(idx)) {
      context.emitBookTagsEvt(TagDeselected(tag: tags[idx]));
      _selectedTags.remove(idx);
    } else {
      context.emitBookTagsEvt(TagSelected(tag: tags[idx]));
      _selectedTags.add(idx);
    }
    setState(() {});
  }

  List<Color> _inactiveColors(BuildContext context, List<Tag> tags) {
    return tags.map((_) => Theme.of(context).colorScheme.background).toList();
  }
}
