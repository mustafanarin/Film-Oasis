import 'package:film_oasis/product/constants/enum/icon_sizes.dart';
import 'package:film_oasis/product/constants/enum/project_elevation.dart';
import 'package:film_oasis/product/constants/enum/project_radius.dart';
import 'package:film_oasis/product/constants/enum/widget_padding.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static ThemeData get getLightTheme => ThemeData.light().copyWith(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: _ProjectTextStyle.bodyLarge,
          elevation: ProjectElevation.zero.value,
          scrolledUnderElevation: ProjectElevation.zero.value,
          backgroundColor: ProjectColors.white,
          iconTheme: IconThemeData(
            size: IconSizes.normal.value,
          ),
        ),
        scaffoldBackgroundColor: ProjectColors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ProjectColors.white,
          selectedItemColor: ProjectColors.black,
          unselectedItemColor: ProjectColors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: ProjectElevation.medium.value,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ProjectColors.white,
            foregroundColor: ProjectColors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.allLarge(),
              side: BorderSide(color: ProjectColors.grey.withOpacity(0.50)),
            ),
            padding: AppPadding.symmetric(),
            elevation: ProjectElevation.zero.value,
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: ProjectColors.cobaltBlue,
          actionTextColor: ProjectColors.white,
        ),
        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: ProjectColors.cobaltBlue,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ProjectColors.cobaltBlue),
          ),
          enabledBorder: const OutlineInputBorder(),
          hintStyle: _ProjectTextStyle.bodyMedium.copyWith(color: ProjectColors.grey),
        ),
        textTheme: const TextTheme(
          titleMedium: _ProjectTextStyle.titleMediumText,
          bodyLarge: _ProjectTextStyle.bodyLarge,
          bodyMedium: _ProjectTextStyle.bodyMedium,
          bodySmall: _ProjectTextStyle.bodySmall,
          labelMedium: _ProjectTextStyle.labelMedium,
          labelSmall: _ProjectTextStyle.labelSmall,
        ),
      );

  static ThemeData get getDarkTheme => ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          titleTextStyle: _ProjectTextStyle.bodyLarge.copyWith(
            color: ProjectColors.darkTextColor,
          ),
          elevation: ProjectElevation.zero.value,
          scrolledUnderElevation: ProjectElevation.zero.value,
          backgroundColor: ProjectColors.darkBackground,
          iconTheme: IconThemeData(
            size: IconSizes.normal.value,
            color: ProjectColors.darkTextColor,
          ),
        ),
        scaffoldBackgroundColor: ProjectColors.darkBackground,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: ProjectColors.darkBackground,
          selectedItemColor: ProjectColors.cobaltBlue,
          unselectedItemColor: ProjectColors.white.withOpacity(0.6),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          elevation: ProjectElevation.medium.value,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: ProjectColors.darkSurface,
            foregroundColor: ProjectColors.darkTextColor,
            shape: RoundedRectangleBorder(
              borderRadius: AppRadius.allLarge(),
              side: BorderSide(color: ProjectColors.grey.withOpacity(0.50)),
            ),
            padding: AppPadding.symmetric(),
            elevation: ProjectElevation.zero.value,
          ),
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: ProjectColors.cobaltBlue,
          actionTextColor: ProjectColors.darkTextColor,
        ),
        inputDecorationTheme: InputDecorationTheme(
          suffixIconColor: ProjectColors.cobaltBlue,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: ProjectColors.cobaltBlue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ProjectColors.grey.withOpacity(0.3)),
          ),
          hintStyle: _ProjectTextStyle.bodyMedium.copyWith(
            color: ProjectColors.darkGreyText,
          ),
        ),
        textTheme: TextTheme(
          titleMedium: _ProjectTextStyle.titleMediumText.copyWith(
            color: ProjectColors.darkTextColor,
          ),
          bodyLarge: _ProjectTextStyle.bodyLarge.copyWith(
            color: ProjectColors.darkTextColor,
          ),
          bodyMedium: _ProjectTextStyle.bodyMedium.copyWith(
            color: ProjectColors.darkTextColor,
          ),
          bodySmall: _ProjectTextStyle.bodySmall.copyWith(
            color: ProjectColors.darkGreyText,
          ),
          labelMedium: _ProjectTextStyle.labelMedium.copyWith(
            color: ProjectColors.darkTextColor,
          ),
          labelSmall: _ProjectTextStyle.labelSmall,
        ),
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
