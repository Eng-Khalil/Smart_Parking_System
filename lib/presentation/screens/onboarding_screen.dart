import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/utils/constants.dart';
// import 'core/utils/device_utils.dart';
import '../resusable_widgets/custom_button.dart';
// import 'package:our_app/presentation/screens/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  static const routeName = '/welcome'; // Named route matching WelcomeScreen

  const OnboardingScreen({super.key});

  // Check if onboarding has been seen and show showcase
  Future<void> _checkFirstTime(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('seenOnboardingScreen')) {
      // Delay to ensure widget is mounted
      Future.delayed(Duration.zero, () {
        if (context.mounted) {
          ShowCaseWidget.of(context).startShowCase([GlobalKey()]);
          prefs.setBool('seenOnboardingScreen', true);
        }
      });
    }
  }

  // Theme dialog from original OnboardingScreen
  void _showThemeDialog(BuildContext context, bool isDark) {
    final appTheme = Provider.of<AppTheme>(context, listen: false);
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            contentPadding: EdgeInsets.all(AppConstants().padding),
            content: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Theme.of(context).dividerColor,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(AppConstants().padding),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppConstants.themeSettings,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: AppConstants.spacingMediumValue,
                  ), // Ensure spacingMediumValue is a valid double
                  ToggleButtons(
                    isSelected: [
                      appTheme.themeMode == ThemeModeOption.dark,
                      appTheme.themeMode == ThemeModeOption.light,
                      appTheme.themeMode == ThemeModeOption.system,
                    ],
                    onPressed: (index) {
                      if (index == 0) {
                        appTheme.setThemeMode(ThemeModeOption.dark);
                      }
                      if (index == 1) {
                        appTheme.setThemeMode(ThemeModeOption.light);
                      }
                      if (index == 2) {
                        appTheme.setThemeMode(ThemeModeOption.system);
                      }
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(8),
                    selectedColor:
                        isDark
                            ? AppConstants.darkBackground
                            : AppConstants.lightBackground,
                    fillColor:
                        isDark
                            ? AppConstants.darkPrimary
                            : AppConstants.lightPrimary,
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text('Dark'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text('Light'),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Text('System'),
                      ),
                    ],
                  ),
                  SizedBox(height: AppConstants.spacingMediumValue),
                  SwitchListTile(
                    title: Text(AppConstants.useDarkGradient),
                    value: appTheme.useDarkGradient,
                    onChanged: (value) {
                      appTheme.toggleDarkGradient(value);
                      Navigator.pop(context);
                    },
                    activeColor: AppConstants.darkPrimary,
                  ),
                ],
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<AppTheme>(context);
    final isDark =
        appTheme.themeMode == ThemeModeOption.dark ||
        (appTheme.themeMode == ThemeModeOption.system &&
            MediaQuery.of(context).platformBrightness == Brightness.dark);

    // Trigger showcase for first-time users
    _checkFirstTime(context);

    return ShowCaseWidget(
      builder: Builder(
        builder:
            (context) => Scaffold(
              appBar: AppBar(
                title: const Text(AppStrings.welcomeTitle),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              body: Container(
                decoration: BoxDecoration(
                  gradient: AppTheme.getGradient(
                    isDark,
                    appTheme.useDarkGradient,
                  ),
                ),
                child: SafeArea(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants().padding,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.welcomeMessage,
                            style: Theme.of(
                              context,
                            ).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                            textAlign: TextAlign.center,
                            semanticsLabel: AppStrings.welcomeMessage,
                          ),
                          SizedBox(
                            height: AppConstants.spacingLarge.toDouble(),
                          ),
                          FadeTransition(
                            opacity: Tween<double>(begin: 0, end: 1).animate(
                              CurvedAnimation(
                                parent: AnimationController(
                                  vsync: Navigator.of(context),
                                  duration: const Duration(milliseconds: 1500),
                                )..forward(),
                                curve: Curves.easeInOut,
                              ),
                            ),
                            child: Icon(
                              Icons.local_parking,
                              size: DeviceUtils.getResponsiveSize(
                                context,
                                AppConstants.iconSizeFactor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppConstants.spacingLarge.toDouble(),
                          ),
                          CustomButton(
                            text: AppStrings.getStartedButton,
                            onPressed: () {
                              HapticFeedback.heavyImpact();
                              Navigator.pushNamed(
                                context,
                                AppRoutes.login,
                              ).catchError((e) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Navigation error: $e'),
                                  ),
                                );
                              });
                            },
                            isDark: isDark,
                          ),
                          SizedBox(
                            height: AppConstants.spacingMedium.toDouble(),
                          ),
                          Showcase(
                            key: GlobalKey(),
                            description: 'Tap to switch themes.',
                            child: IconButton(
                              icon: Icon(
                                isDark ? Icons.wb_sunny : Icons.nights_stay,
                              ),
                              onPressed:
                                  () => _showThemeDialog(context, isDark),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

class DeviceUtils {
  static getResponsiveSize(BuildContext context, iconSizeFactor) {}
}

extension on SizedBox {
  toDouble() {}
}

class ThemeModeOption {
  static const dark = ThemeMode.dark;

  static const light = ThemeMode.light;

  static const system = ThemeMode.system;
}

// Update constants.dart (lib/constants.dart)
class AppStrings {
  static const welcomeTitle = 'Welcome to Smart Parking';
  static const welcomeMessage =
      'Your solution to parking hassles.'; // From first onboarding page
  static const getStartedButton = 'Get Started';
}
