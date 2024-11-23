part of '../search_page.dart';

final class _NoResultView extends StatelessWidget {
  const _NoResultView(this.clearSearch);
  final VoidCallback clearSearch;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            Icon(
              Icons.search_off_outlined,
              size: context.dynamicHeight(0.12),
              color: ProjectColors.grey.withOpacity(0.5),
            ),
             Text(ProjectStrings.noFoundFilm,style: context.textTheme().bodyMedium,
              textAlign: TextAlign.center,),
            SearchClearButton(onClearSearch: clearSearch),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
