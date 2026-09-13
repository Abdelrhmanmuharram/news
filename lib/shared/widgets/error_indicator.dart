import 'package:flutter/material.dart';
import 'package:news/shared/app_theme.dart';

class ErrorIndicator extends StatelessWidget {
  final String message;
  const ErrorIndicator({super.key, this.message = 'Somthing went wrong'});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message, style: TextStyle(color: AppTheme.white)),
    );
  }
}
