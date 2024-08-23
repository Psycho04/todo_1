import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_1/firebase_options.dart';
import 'package:todo_1/providers/language_provider.dart';
import 'package:todo_1/providers/list_provider.dart';
import 'package:todo_1/providers/theme_provider.dart';
import 'package:todo_1/screens/auth/login.dart';
import 'package:todo_1/screens/auth/signup.dart';
import 'package:todo_1/screens/home/home_page.dart';
import 'package:todo_1/screens/splash/splash_screen.dart';
import 'package:todo_1/core/themes/dark.dart';
import 'package:todo_1/core/themes/light.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: ChangeNotifierProvider(
      create: (context) => LanguageProvider(),
      child: ChangeNotifierProvider(
          create: (context) => ListProvider(), child: const MyApp()),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      locale: Locale(languageProvider.selectedLang),
      title: 'T O D O',
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        HomePage.routeName: (context) => const HomePage(),
        LogIn.routeName: (context) => const LogIn(),
        SignUp.routeName: (context) => const SignUp(),
      },
      initialRoute: LogIn.routeName,
      theme: MyLightTheme.lightTheme,
      darkTheme: MyDarkTheme.darkTheme,
      themeMode: themeProvider.selectedTheme,
    );
  }
}
