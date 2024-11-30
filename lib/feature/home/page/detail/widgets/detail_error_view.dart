part of '../detail_page.dart';

class _DetailErrorView extends ConsumerWidget {
  const _DetailErrorView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Container(
          height: Theme.of(context).appBarTheme.toolbarHeight,
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Padding(
            padding: EdgeInsets.only(top: context.lowValue2),
            child: Row(
              children: [
                IconButton(
                  onPressed: () => context.maybePop(),
                  icon: const Icon(Icons.arrow_back_outlined),
                ),
                const Spacer(
                  flex: 2,
                ),
                Text(
                  ProjectStrings.detailTitle,
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
                const Spacer(
                  flex: 3,
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: ErrorView(),
          ),
        ),
      ],
    );
  }
}
