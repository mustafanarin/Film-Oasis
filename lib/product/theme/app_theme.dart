
import 'package:film_oasis/product/constants/enum/button_padding.dart';
import 'package:film_oasis/product/constants/enum/button_radius.dart';
import 'package:film_oasis/product/constants/enum/icon_sizes.dart';
import 'package:film_oasis/product/constants/project_colors.dart';
import 'package:flutter/material.dart';


abstract final class AppTheme {


  static ThemeData get getLightTheme => ThemeData.light().copyWith(
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: _bodyLarge,
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: ProjectColors.white,
      iconTheme: IconThemeData(size: IconSizes.normalIcon.value,),
    ),
    scaffoldBackgroundColor: ProjectColors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ProjectColors.white,
        foregroundColor: ProjectColors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(ButtonRadius.radius.value),),
          side: BorderSide(color: ProjectColors.grey.withOpacity(0.50))
        ),
        padding: EdgeInsets.symmetric(horizontal: ButtonPadding.horizontal.value,
        vertical: ButtonPadding.vertical.value
        ),
        elevation: 0,
      )
    ),
    textTheme: const TextTheme(
      titleMedium: _titleMediumText,
      bodyLarge: _bodyLarge,
      bodyMedium: _bodyMedium,
      bodySmall: _bodySmall,
    ),
  );


}

const _titleMediumText = TextStyle(  // for film detail 
  color: ProjectColors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const _bodyLarge = TextStyle(  // for appbar and title
  color: ProjectColors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const _bodyMedium = TextStyle( // for film name
  color: ProjectColors.black,
  fontWeight: FontWeight.bold,
  fontSize: 16,
);

const _bodySmall = TextStyle( // for normal text
  color: ProjectColors.black,
  fontWeight: FontWeight.w400,
  fontSize: 12,
);