import 'package:flutter/material.dart';
import 'package:news/app_theme.dart';
import 'package:news/models/category_model.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  CategoryModel category;
  int index;
  CategoryItem({super.key, required this.category, required this.index});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: settingsProvider.isDark ? AppTheme.white : AppTheme.black,
      ),
      clipBehavior: .antiAlias,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/${category.imageName}.png',
            height: double.infinity,
            width: double.infinity,
            fit: .fill,
          ),
          Positioned.directional(
            textDirection: Directionality.of(context),
            top: 50,
            start: index.isOdd ? 40 : null,
            end: index.isEven ? 40 : null,
            child: Text(
              category.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ],
      ),
    );
  }
}
