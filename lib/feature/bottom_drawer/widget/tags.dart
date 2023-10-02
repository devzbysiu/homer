import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/tag_entity.dart';
import 'package:homer/core/book/domain/use_case/change_book_tags/book_tags_bloc.dart';
import 'package:homer/core/utils/color_mapper.dart';
import 'package:homer/core/utils/extensions.dart';

class Tags extends StatefulWidget {
  const Tags({super.key});

  @override
  State<Tags> createState() => _TagsState();
}

class _TagsState extends State<Tags> {

  final Set<int> _selectedTags = {};

  @override
  Widget build(BuildContext context) {
    final tags = context.allTags();
    return ChipList(
      supportsMultiSelect: true,
      listOfChipNames: tags.map((tag) => tag.name).toList(),
      extraOnToggle: (idx) => _tagSelected(context, idx, tags),
      // NOTE: it can't be `const` because selecting a chip won't work
      // ignore: prefer_const_literals_to_create_immutables
      listOfChipIndicesCurrentlySeclected: _selectedTags.toList(),
      inactiveBorderColorList: _tagColors(tags),
      inactiveTextColorList: _blackColors(tags),
      activeBgColorList: _tagColors(tags),
      activeTextColorList: _whiteColors(tags),
    );
  }

  List<Color> _tagColors(List<TagEntity> tags) {
    return tags.map((tag) => toFlutterColor(tag.color)).toList();
  }

  List<Color> _blackColors(List<TagEntity> tags) {
    return tags.map((_) => Colors.black).toList();
  }

  List<Color> _whiteColors(List<TagEntity> tags) {
    return tags.map((_) => Colors.white).toList();
  }

  void _tagSelected(BuildContext context, int idx, List<TagEntity> tags) {
    if (_selectedTags.contains(idx)) {
      context.emitBookTagsEvt(TagDeselected(tag: tags[idx]));
      _selectedTags.remove(idx);
    } else {
      context.emitBookTagsEvt(TagSelected(tag: tags[idx]));
      _selectedTags.add(idx);
    }
    setState(() {});
  }
}