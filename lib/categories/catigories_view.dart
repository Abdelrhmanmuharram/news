import 'package:flutter/material.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/models/category_model.dart';

class CatigoriesView extends StatelessWidget {
  const CatigoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
        padding: const EdgeInsetsDirectional.only(top: 16, start: 16, end: 16),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              appLocalizations.goodMorningHereisSomeNewsForYou,
              style: textTheme.titleLarge,
            ),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(top: 16, bottom: 16),
                itemBuilder: (_, index) => CategoryItem(
                  index: index,
                  category: CategoryModel.categories[index],
                ),
                separatorBuilder: (_, _) => SizedBox(height: 16),
                itemCount: CategoryModel.categories.length,
              ),
            ),
          ],
        ),
      );
  }
}