import 'package:flutter/material.dart';
import 'package:news/categories/view/widgets/category_item.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/categories/data/model/category_model.dart';
import 'package:news/providers/settings_provider.dart';
import 'package:provider/provider.dart';

class CatigoriesView extends StatelessWidget {
  void Function(CategoryModel) onSelectedCategory;
  CatigoriesView({super.key, required this.onSelectedCategory});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
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
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  settingsProvider.isArabic
                      ? onSelectedCategory(
                          CategoryModel.categoriesArabic[index],
                        )
                      : onSelectedCategory(CategoryModel.categories[index]);
                },
                child: CategoryItem(
                  index: index,
                  category: settingsProvider.isArabic
                      ? CategoryModel.categoriesArabic[index]
                      : CategoryModel.categories[index],
                ),
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
