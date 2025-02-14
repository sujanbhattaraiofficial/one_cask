// core/themes/app_theme.dart
import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme Configuration
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      primary: Color(0xFFD49A00),
      secondary: Color(0xFFFFB901),
      surface: Color(0xFFF8F9FA),
      background: Color(0xFFFFFFFF),
      onSurface: Color(0xFF212529),
    ),
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
    appBarTheme: const AppBarTheme(
      color: Color(0xFFF8F9FA),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFF212529)),
    ),
    textTheme: _buildLightTextTheme(),
    inputDecorationTheme: _buildLightInputDecoration(),
    elevatedButtonTheme: _buildElevatedButtonTheme(),
    extensions: <ThemeExtension<dynamic>>[
      _CustomThemeExtension(
        secondaryText: const Color(0xFFFFB901),
        disabledText: const Color(0xFF212529).withOpacity(0.5),
      ),
    ],
  );

  // Dark Theme Configuration
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFD49A00),
      secondary: Color(0xFFFFB901),
      surface: Color(0xFF0E1C21),
      background: Color(0xFF0B1519),
      onSurface: Color(0xFFB8BDBF),
    ),
    scaffoldBackgroundColor: const Color(0xFF0B1519),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF0E1C21),
      elevation: 0,
      iconTheme: IconThemeData(color: Color(0xFFB8BDBF)),
    ),
    textTheme: _buildDarkTextTheme(),
    inputDecorationTheme: _buildDarkInputDecoration(),
    elevatedButtonTheme: _buildElevatedButtonTheme(),
    extensions: <ThemeExtension<dynamic>>[
      _CustomThemeExtension(
        secondaryText: const Color(0xFFFFB901),
        disabledText: const Color(0xFFB8BDBF).withOpacity(0.5),
      ),
    ],
  );

  // Text Themes
  static TextTheme _buildLightTextTheme() {
    return TextTheme(
      displayLarge: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFF212529),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: const Color(0xFF212529).withOpacity(0.9),
      ),
      // Add other text styles...
    );
  }

  static TextTheme _buildDarkTextTheme() {
    return TextTheme(
      displayLarge: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: Color(0xFFB8BDBF),
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: const Color(0xFFB8BDBF).withOpacity(0.9),
      ),
      // Add other text styles...
    );
  }

  // Input Decoration Themes
  static InputDecorationTheme _buildLightInputDecoration() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFF212529)),
      ),
      // Add other decorations...
    );
  }

  static InputDecorationTheme _buildDarkInputDecoration() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: Color(0xFFB8BDBF)),
      ),
      // Add other decorations...
    );
  }

  // Elevated Button Theme
  static ElevatedButtonThemeData _buildElevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}

// Custom Theme Extensions
class _CustomThemeExtension extends ThemeExtension<_CustomThemeExtension> {
  final Color secondaryText;
  final Color disabledText;

  const _CustomThemeExtension({
    required this.secondaryText,
    required this.disabledText,
  });

  @override
  ThemeExtension<_CustomThemeExtension> copyWith({
    Color? secondaryText,
    Color? disabledText,
  }) {
    return _CustomThemeExtension(
      secondaryText: secondaryText ?? this.secondaryText,
      disabledText: disabledText ?? this.disabledText,
    );
  }

  @override
  ThemeExtension<_CustomThemeExtension> lerp(
    covariant ThemeExtension<_CustomThemeExtension>? other,
    double t,
  ) {
    if (other is! _CustomThemeExtension) return this;
    return _CustomThemeExtension(
      secondaryText: Color.lerp(secondaryText, other.secondaryText, t)!,
      disabledText: Color.lerp(disabledText, other.disabledText, t)!,
    );
  }
}

// Context Extensions
extension ThemeContextExtension on BuildContext {
  Color get primaryColor => Theme.of(this).colorScheme.primary;
  Color get secondaryColor => Theme.of(this).colorScheme.secondary;
  Color get surfaceColor => Theme.of(this).colorScheme.surface;
  Color get onSurfaceColor => Theme.of(this).colorScheme.onSurface;
  Color get secondaryTextColor =>
      Theme.of(this).extension<_CustomThemeExtension>()!.secondaryText;
  Color get disabledTextColor =>
      Theme.of(this).extension<_CustomThemeExtension>()!.disabledText;
}
