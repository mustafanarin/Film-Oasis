import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchPageState();
}
class _SearchPageState extends ConsumerState<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.cobaltBlue,
      body: Center(
        child: const Text('Search'),
      ),
    );
  }
}