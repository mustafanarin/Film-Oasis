part of '../search_page.dart';

final class _TextNoSearch extends StatelessWidget {
  const _TextNoSearch();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(
        child: Text(ProjectStrings.noSearchText),
      ),
    );
  }
}
