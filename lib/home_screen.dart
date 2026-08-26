import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news/api/api_service.dart';
import 'package:news/categories/catigories_view.dart';
import 'package:news/drawer/drawer_item.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/models/category_model.dart';
import 'package:news/models/news_response/news_response.dart';
import 'package:news/news/news_view.dart';

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
  NewsResponse? searchResult;
  CategoryModel? selectedCategory;

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
                      setState(() {
                        searchResult = null;
                      });
                      return;
                    }
                    searchTimer = Timer(
                      const Duration(milliseconds: 500),
                      () async {
                        searchResult = await ApiService.searchNews(value);
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
                  searchResult = null;
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
      body: searchResult != null
          ? NewsView(searchResult: searchResult)
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
