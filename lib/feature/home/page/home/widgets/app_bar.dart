part of '../home_page.dart';

class _AppbarHomePage extends StatelessWidget implements PreferredSizeWidget {
  const _AppbarHomePage();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(ProjectStrings.projectName),
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu_outlined)),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined))],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}