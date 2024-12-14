import 'package:auto_route/auto_route.dart';
import 'package:film_oasis/feature/favorite/page/favorites_page.dart';
import 'package:film_oasis/feature/home/page/home/home_page.dart';
import 'package:film_oasis/feature/search/page/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
@RoutePage()
class TabbarPage extends HookWidget {
  const TabbarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pageController = usePageController();
    final selectedIndex = useState(0);

    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: PageView(
          controller: pageController,
          onPageChanged: (index) => selectedIndex.value = index,
          children: const [
            HomePage(),
            SearchPage(),
            FavoritesPage(),
          ],
        ),
      ),  
      bottomNavigationBar: BottomNavigationBar(
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
            icon: Icon(Icons.favorite_outline),
            label: '',
          ),
        ],
        currentIndex: selectedIndex.value,
        onTap: (index) {
          FocusScope.of(context).unfocus(); 
          pageController.jumpToPage(index); 
          selectedIndex.value = index;
        },
      ),
    );
  }
}
