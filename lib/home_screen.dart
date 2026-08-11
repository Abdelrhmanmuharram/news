import 'package:flutter/material.dart';
import 'package:news/categories/catigories_view.dart';
import 'package:news/drawer/drawer_item.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/models/category_model.dart';
import 'package:news/news/news_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? selectedCategory;
  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null
              ? appLocalizations.home
              : selectedCategory!.name,
        ),
      ),
      drawer: DrawerItem(onGoToHomeClick: resetSelectedCategoty),
      body: selectedCategory == null
          ? CatigoriesView(onSelectedCategory: onSelectedCategory)
          : NewsView(categoryId: selectedCategory!.id),
    );
  }

  void onSelectedCategory(CategoryModel category) {
    selectedCategory = category;
    setState(() {});
  }

  void resetSelectedCategoty() {
    if (selectedCategory == null) return;
    selectedCategory = null;
    setState(() {});
  }
}
