part of '../favorites_page.dart';

class _FavoritesAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _FavoritesAppBar({
    required this.isSearching,
    required this.onSearchToggle,
    required this.searchController,
    required this.searchFocusNode,
    required this.animationController,
    required this.onSearchChanged,
  });
  final bool isSearching;
  final VoidCallback onSearchToggle;
  final TextEditingController searchController;
  final FocusNode searchFocusNode;
  final AnimationController animationController;
  final ValueChanged<String> onSearchChanged;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isSearching
          ? _SearchField(
              controller: searchController,
              focusNode: searchFocusNode,
              animationController: animationController,
              onChanged: onSearchChanged,
            )
          : const Text(ProjectStrings.favoriteText),
      centerTitle: !isSearching,
      actions: [
        IconButton(
          icon: Icon(isSearching ? Icons.close : Icons.search),
          onPressed: onSearchToggle,
        ),
        if (isSearching) SizedBox(width: context.lowValue1),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.focusNode,
    required this.animationController,
    required this.onChanged,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final AnimationController animationController;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: animationController,
      axis: Axis.horizontal,
      axisAlignment: -1,
      child: ProjectTextField(
        controller: controller,
        focusNode: focusNode,
        contentPadding: EdgeInsets.symmetric(
          horizontal: context.lowValue2,
          vertical: context.lowValue1,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
