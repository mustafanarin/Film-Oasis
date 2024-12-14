import 'package:film_oasis/product/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ReleaseDateText extends StatelessWidget {
  const ReleaseDateText({
    required this.releaseDate,
    super.key,
  });

  final String? releaseDate;

  @override
  Widget build(BuildContext context) {
    if (releaseDate == null || releaseDate!.isEmpty) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Icon(Icons.calendar_today, size: context.lowValue2),
        SizedBox(width: context.lowValue1),
        Text(
          _formatDayMonthYearDate(releaseDate!),
          style: context.textTheme().bodySmall,
        ),
      ],
    );
  }

  String _formatDayMonthYearDate(String date) {
    try {
      return DateFormat('dd MMM yyyy').format(DateTime.parse(date));
    } catch (e) {
      return date;
    }
  }
}
