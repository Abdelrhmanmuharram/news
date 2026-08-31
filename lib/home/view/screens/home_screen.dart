import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/categories/view/widgets/catigories_view.dart';
import 'package:news/home/view/widgets/drawer_item.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/categories/data/model/category_model.dart';
import 'package:news/news/view/widgets/news_view.dart';
import 'package:news/news/view_model/news_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();
  Timer? searchTimer;
  bool isSearchOpen = false;
  CategoryModel? selectedCategory;
  NewsViewModel newsViewModel = NewsViewModel();

  @override
  void dispose() {
    searchTimer?.cancel();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: isSearchOpen
            ? SizedBox(
                height: 62,
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    searchTimer?.cancel();
                    if (value.isEmpty) {
                      setState(() {});
                      return;
                    }
                    searchTimer = Timer(
                      const Duration(milliseconds: 500),
                      () async {
                        await newsViewModel.searchNews(value);
                        setState(() {});
                      },
                    );
                  },
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              )
            : Text(
                selectedCategory == null
                    ? appLocalizations.home
                    : selectedCategory!.name,
              ),
        actions: [
          if (isSearchOpen)
            IconButton(
              onPressed: () {
                setState(() {
                  isSearchOpen = false;
                  searchController.clear();
                });
              },
              icon: const Icon(Icons.close),
            )
          else ...[
            GestureDetector(
              onTap: () {
                setState(() {
                  isSearchOpen = true;
                });
              },
              child: SvgPicture.asset(
                'assets/icons/search.svg',
                width: 24,
                height: 24,
                fit: .scaleDown,
              ),
            ),
            SizedBox(width: MediaQuery.sizeOf(context).width * 0.05),
          ],
        ],
      ),
      drawer: isSearchOpen
          ? null
          : DrawerItem(onGoToHomeClick: resetSelectedCategoty),
      body: isSearchOpen && searchController.text.isNotEmpty
          ? NewsView(searchResult: newsViewModel.search)
          : selectedCategory == null
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
