import 'package:flutter/material.dart';
import 'package:news/categories/category_item.dart';
import 'package:news/categories/catigorise_view.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/models/category_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text(appLocalizations.home)),
      body: CatigoriseView(),
    );
  }
}
