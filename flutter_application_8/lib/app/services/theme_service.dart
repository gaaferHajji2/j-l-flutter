import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

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
