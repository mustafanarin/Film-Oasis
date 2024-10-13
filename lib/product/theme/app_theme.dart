
import 'package:film_oasis/product/constants/enum/button_padding.dart';
import 'package:film_oasis/product/constants/enum/project_radius.dart';
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
          borderRadius: BorderRadius.all(Radius.circular(ProjectRadius.button.value),),
          side: BorderSide(color: ProjectColors.grey.withOpacity(0.50)),
        ),
        padding: EdgeInsets.symmetric(horizontal: ButtonPadding.horizontal.value,
        vertical: ButtonPadding.vertical.value,
        ),
        elevation: 0,
      ),
    ),
    textTheme: const TextTheme(
      titleMedium: _titleMediumText,
      bodyLarge: _bodyLarge,
      bodyMedium: _bodyMedium,
      bodySmall: _bodySmall,
      labelMedium: _labelMedium,
      labelSmall: _labelSmall
    ),
  );


}

const _titleMediumText = TextStyle(  // for film detail 
  fontFamily: 'Mulish-Bold',
  color: ProjectColors.black,
  fontWeight: FontWeight.bold,
  fontSize: 20,
);

const _bodyLarge = TextStyle(  // for appbar and title
  fontFamily: 'Merriweather',
  color: ProjectColors.black,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);

const _bodyMedium = TextStyle( // for film name
  fontFamily: 'Mulish-Bold',
  color: ProjectColors.black,
  fontWeight: FontWeight.bold,
  fontSize: 15,
);

const  _bodySmall = TextStyle( // for normal text
  fontFamily: 'Mulish-Regular',
  color: ProjectColors.greyText,
  fontWeight: FontWeight.w700,
  fontSize: 12,
);
const  _labelMedium = TextStyle( // for normal text
  fontFamily: 'Mulish-Regular',
  color: ProjectColors.black,
  fontWeight: FontWeight.w700,
  fontSize: 12,
);
const _labelSmall = TextStyle( // for genre
  fontFamily: 'Mulish-Bold',
  color: ProjectColors.cobaltBlue,
  fontWeight: FontWeight.w400,
  fontSize: 10,
);