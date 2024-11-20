part of '../detail_page.dart';

class _TextTagline extends StatelessWidget {
  const _TextTagline({
    required this.tagline,
  });

  final String? tagline;

  @override
  Widget build(BuildContext context) {
    if (tagline == null || tagline!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(bottom: context.lowValue1),
      child: Text(
        '"$tagline"',
        style: context.textTheme().bodyMedium?.copyWith(
              fontStyle: FontStyle.italic,
              color: ProjectColors.grey,
            ),
      ),
    );
  }
}