import 'package:flutter/material.dart';
import 'package:todo/core/presentation/resources/color_manager.dart';
import 'package:todo/core/presentation/resources/constants_manager.dart';
import 'package:todo/core/presentation/resources/font_manager.dart';
import 'package:todo/core/presentation/resources/radius_manager.dart';
import 'package:todo/core/presentation/resources/styles_manager.dart';
import 'package:todo/core/presentation/resources/values_manager.dart';

//Light theme
ThemeData getLightTheme() => ThemeData(
      colorSchemeSeed: ColorManager.primary,
      //AppBar
      appBarTheme: AppBarTheme(
        color: ColorManager.white,
        elevation: Constants.appBarElevation,
        titleTextStyle: getSemiBoldTextStyle(
          fontSize: FontSizeManager.s22,
          color: ColorManager.black,
        ),
        foregroundColor: ColorManager.black,
        actionsIconTheme: const IconThemeData(color: ColorManager.black),
      ),
      //TabBar
      tabBarTheme: const TabBarTheme(
        labelColor: ColorManager.black,
        unselectedLabelColor: ColorManager.lightGrey,
      ),
      //ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularTextStyle(
            color: ColorManager.white,
            fontSize: FontSizeManager.s18,
          ),
          primary: ColorManager.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(RadiusManager.r12)),
          ),
        ),
      ),
      //Text
      textTheme: TextTheme(
        titleLarge: getSemiBoldTextStyle(
          color: ColorManager.black,
          fontSize: FontSizeManager.s20,
        ),
        bodyLarge: getMediumTextStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSizeManager.s16,
        ),
        bodyMedium: getMediumTextStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s16,
        ),
        bodySmall: getRegularTextStyle(
          color: ColorManager.grey,
        ),
      ),
      //InputDecoration
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(Insets.i8),
        filled: true,
        fillColor: ColorManager.offWhite,
        hintStyle: getMediumTextStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSizeManager.s16,
        ),
        labelStyle: getMediumTextStyle(
          color: ColorManager.grey,
          fontSize: FontSizeManager.s14,
        ),
        errorStyle: getRegularTextStyle(
          color: ColorManager.error,
          fontSize: FontSizeManager.s14,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(RadiusManager.r8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(RadiusManager.r8),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(RadiusManager.r8),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(RadiusManager.r8),
          ),
        ),
      ),
    );

//Dark theme
ThemeData getDarkTheme() => ThemeData(
      colorSchemeSeed: ColorManager.primary,
      //AppBar
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManager.primary,
        elevation: AppSize.s4,
        titleTextStyle: getRegularTextStyle(
          fontSize: FontSizeManager.s16,
          color: ColorManager.white,
        ),
      ),
      //TabBar
      tabBarTheme: const TabBarTheme(
        labelColor: ColorManager.white,
        unselectedLabelColor: ColorManager.lightGrey,
      ),
      //ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularTextStyle(
            color: ColorManager.white,
            fontSize: FontSizeManager.s18,
          ),
          primary: ColorManager.primary,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(RadiusManager.r12)),
          ),
        ),
      ),
      //Text
      textTheme: TextTheme(
        titleLarge: getLightTextStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s22,
        ),
        bodyLarge: getSemiBoldTextStyle(
          color: ColorManager.darkGrey,
          fontSize: FontSizeManager.s16,
        ),
        bodyMedium: getMediumTextStyle(
          color: ColorManager.lightGrey,
          fontSize: FontSizeManager.s14,
        ),
        bodySmall: getRegularTextStyle(
          color: ColorManager.grey,
        ),
      ),
      //InputDecoration
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(Insets.i8),
        hintStyle: getRegularTextStyle(
          color: ColorManager.grey,
          fontSize: FontSizeManager.s14,
        ),
        labelStyle: getMediumTextStyle(
          color: ColorManager.grey,
          fontSize: FontSizeManager.s14,
        ),
        errorStyle: getRegularTextStyle(
          color: ColorManager.error,
          fontSize: FontSizeManager.s14,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(RadiusManager.r8),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.grey,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(RadiusManager.r8),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.error,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(RadiusManager.r8),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary,
            width: AppSize.s1_5,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(RadiusManager.r8),
          ),
        ),
      ),
    );
