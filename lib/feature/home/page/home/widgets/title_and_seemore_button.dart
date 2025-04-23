part of '../home_page.dart';

class _RowTitleAndButton extends ConsumerWidget {
  const _RowTitleAndButton({
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _ = ref.watch(AppProviderItems.languageProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.textTheme().bodyLarge,
        ),
        SeeMoreButton(onPressed: onPressed),
      ],
    );
  }
}
