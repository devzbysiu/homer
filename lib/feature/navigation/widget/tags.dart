import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';

class Tags extends StatelessWidget {
  const Tags({super.key});

  @override
  Widget build(BuildContext context) {
    return ChipList(
      padding: const EdgeInsets.only(right: 10),
      supportsMultiSelect: true,
      listOfChipNames: const [
        'One',
        'Two',
        'Three',
        'Four',
        'Five',
        'Six',
        'Seven',
        'Eight',
        'Nine',
        'Ten',
      ],
      // NOTE: it can't be `const` because selecting a chip won't work
      // ignore: prefer_const_literals_to_create_immutables
      listOfChipIndicesCurrentlySeclected: [0],
    );
  }
}