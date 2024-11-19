part of '../search_page.dart';

final class _CircularProgessIndicator extends StatelessWidget {
  const _CircularProgessIndicator();

  @override
  Widget build(BuildContext context) {
    return const Expanded(
      child: Center(child: CircularProgressIndicator.adaptive()),
    );
  }
}