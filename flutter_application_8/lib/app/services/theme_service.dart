import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  bool _loadThemFromStorage() => Get.isDarkMode;

  void _saveThemeToStorage(bool isDarkModel) =>
      Get.changeThemeMode(isDarkModel ? ThemeMode.dark : ThemeMode.light);

  ThemeMode get theme =>
      _loadThemFromStorage() ? ThemeMode.dark : ThemeMode.light;

  void switchTheme() {
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.light);
    _saveThemeToStorage(!Get.isDarkMode);
  }
}
