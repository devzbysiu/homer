part of 'bottom_drawer_content.dart';

final class _Tags extends StatefulWidget {
  const _Tags();

  @override
  State<_Tags> createState() => _TagsState();
}

final class _TagsState extends State<_Tags> {
  final Set<int> _selectedTagIndices = {};

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TagsBloc, TagsState, List<Tag>>(
      selector: (state) => state.tags,
      builder: (context, tags) {
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
    return tags.map((tag) => HexColor(tag.hexColor)).toList();
  }

  List<Color> _inactiveText(BuildContext context, List<Tag> tags) {
    return tags.map((_) => context.onBackground).toList();
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
    return tags.map((_) => context.background).toList();
  }
}
