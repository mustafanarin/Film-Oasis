part of '../search_page.dart';
class _defaultSearhPageText extends StatelessWidget {
  const _defaultSearhPageText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Expanded(child: Center(child: Text(ProjectStrings.searchFilmText)));
  }
}