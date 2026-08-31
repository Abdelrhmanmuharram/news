import 'package:flutter/material.dart';
import 'package:news/sources/data/models/source.dart';

class NewsTabItem extends StatelessWidget {
  Source source;
  bool isSelected;

  NewsTabItem({super.key, required this.isSelected, required this.source});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Text(
      source.name!,
      style: isSelected ? textTheme.titleMedium : textTheme.titleSmall,
    );
  }
}
