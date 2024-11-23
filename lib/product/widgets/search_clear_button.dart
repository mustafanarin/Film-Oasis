import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class SearchClearButton extends StatelessWidget {
  const SearchClearButton({
    super.key,
    required this.onClearSearch,
  });

  final VoidCallback onClearSearch;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClearSearch,
      child: Text(
        ProjectStrings.cleanSearch,
        style: context.textTheme().labelMedium,
      ),
    );
  }
}

