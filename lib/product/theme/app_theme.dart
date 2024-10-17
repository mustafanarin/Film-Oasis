import 'package:film_oasis/product/constants/enum/widget_padding.dart';
import 'package:film_oasis/product/constants/enum/icon_sizes.dart';
import 'package:film_oasis/product/constants/enum/project_radius.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get getLightTheme => ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: _ProjectTextStyle.bodyLarge,
          elevation: 0,
          scrolledUnderElevation: 0,
          backgroundColor: ProjectColors.white,
          iconTheme: IconThemeData(
            size: IconSizes.normal.value,
          ),
        ),
        scaffoldBackgroundColor: ProjectColors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ProjectColors.white,
            foregroundColor: ProjectColors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(ProjectRadius.large.value),
              ),
              side: BorderSide(color: ProjectColors.grey.withOpacity(0.50)),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: WidgetPadding.normal.value,
              vertical: WidgetPadding.zero.value,
            ),
            elevation: 0,
          ),
        ),
        textTheme: const TextTheme(
          titleMedium: _ProjectTextStyle.titleMediumText,
          bodyLarge: _ProjectTextStyle.bodyLarge,
          bodyMedium: _ProjectTextStyle.bodyMedium,
          bodySmall: _ProjectTextStyle.bodySmall,
          labelMedium: _ProjectTextStyle.labelMedium,
          labelSmall: _ProjectTextStyle.labelSmall,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: ProjectColors.cobaltBlue,
          actionTextColor: ProjectColors.white
        )
      );
}

class _ProjectTextStyle {
  static const titleMediumText = TextStyle(
    // for film detail
    fontFamily: 'Mulish-Bold',
    color: ProjectColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  static const bodyLarge = TextStyle(
    // for appbar and title
    fontFamily: 'Merriweather',
    color: ProjectColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );

  static const bodyMedium = TextStyle(
    // for film name
    fontFamily: 'Mulish-Bold',
    color: ProjectColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );

  static const bodySmall = TextStyle(
    // for normal text
    fontFamily: 'Mulish-Regular',
    color: ProjectColors.greyText,
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );
  static const labelMedium = TextStyle(
    // for normal text
    fontFamily: 'Mulish-Regular',
    color: ProjectColors.black,
    fontWeight: FontWeight.w700,
    fontSize: 12,
  );
  static const labelSmall = TextStyle(
    // for genre
    fontFamily: 'Mulish-Bold',
    color: ProjectColors.cobaltBlue,
    fontWeight: FontWeight.w400,
    fontSize: 10,
  );
}
