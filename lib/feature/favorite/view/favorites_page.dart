import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class FavoritesPage extends ConsumerStatefulWidget {
  const FavoritesPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends ConsumerState<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColors.lavender,
      body: Center(
        child: const Text('Favorites'),
      ),
    );
  }
}
