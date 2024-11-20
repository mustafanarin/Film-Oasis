part of '../home_page.dart';
class _RowTitleAndButton extends StatelessWidget {
  const _RowTitleAndButton({
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
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