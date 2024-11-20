import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/favorite/page/favorites_page.dart';
import 'package:film_oasis/feature/home/page/home/home_page.dart';
import 'package:film_oasis/feature/search/page/search_page.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

@RoutePage()
class TabbarPage extends HookWidget {
  const TabbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedIndex = useState(0);

    return Scaffold(
      body: IndexedStack(
        index: selectedIndex.value,
        children: const [
          HomePage(),
          SearchPage(),
          FavoritesPage(),
        ],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.movie_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bookmark_outline),
              label: '',
            ),
          ],
          currentIndex: selectedIndex.value,
          onTap: (index) => selectedIndex.value = index,
          backgroundColor: ProjectColors.white,
          selectedItemColor: ProjectColors.black,
          unselectedItemColor: ProjectColors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
