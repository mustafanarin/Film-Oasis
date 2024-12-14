import 'package:film_oasis/product/constants/enum/icon_sizes.dart';
import 'package:film_oasis/product/constants/project_strings.dart';
import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:film_oasis/product/provider/app_provider_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ErrorView extends ConsumerWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(AppProviderItems.languageProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.error_outline, size: IconSizes.xLarge.value),
        SizedBox(height: context.lowValue2),
        Text(ProjectStrings.dontLoadData),
        SizedBox(height: context.lowValue1),
        ElevatedButton(
          onPressed: () => ref.refresh(AppProviderItems.popularFilmsProvider),
          child: Text(ProjectStrings.tryAgain),
        ),
      ],
    );
  }
}
