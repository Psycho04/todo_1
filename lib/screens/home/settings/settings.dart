import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_1/core/themes/light.dart';
import 'package:todo_1/providers/language_provider.dart';
import 'package:todo_1/providers/theme_provider.dart';
import 'package:todo_1/widgets/calender_widget.dart';
import 'package:todo_1/widgets/header_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    LanguageProvider languageProvider = Provider.of(context);
    ThemeProvider themeProvider = Provider.of(context);

    return Column(
      children: [
        Stack(
          children: [
            HeaderWidget(title: AppLocalizations.of(context)!.settings),
            const CalenderWidget(),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.08,
              vertical: MediaQuery.of(context).size.height * 0.07),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.language,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).colorScheme.secondary),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: MyLightTheme.primaryblue),
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                      vertical: MediaQuery.of(context).size.height * 0.006),
                  child: DropdownButton(
                    icon: const Icon(Icons.arrow_drop_down,
                        color: MyLightTheme.primaryblue),
                    style: const TextStyle(
                        color: MyLightTheme.primaryblue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    underline: const SizedBox(),
                    value: languageProvider.selectedLang,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: 'ar',
                        child: Text('العربية'),
                      ),
                      DropdownMenuItem(
                        value: 'en',
                        child: Text('English'),
                      ),
                    ],
                    onChanged: (newLang) {
                      languageProvider.newLang = newLang!;
                      setState(() {});
                    },
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Text(AppLocalizations.of(context)!.theme,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).colorScheme.secondary)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: MyLightTheme.primaryblue),
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(2),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04,
                      vertical: MediaQuery.of(context).size.height * 0.006),
                  child: DropdownButton<ThemeMode>(
                    icon: const Icon(Icons.arrow_drop_down,
                        color: MyLightTheme.primaryblue),
                    style: const TextStyle(
                        color: MyLightTheme.primaryblue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    underline: const SizedBox(),
                    value: themeProvider.selectedTheme,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text('Dark'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text('Light'),
                      ),
                    ],
                    onChanged: (newTheme) {
                      themeProvider.newTheme = newTheme!;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
