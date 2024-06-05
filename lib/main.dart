import 'package:flutter/material.dart';
import 'package:flutter_application_3/booked_page.dart';
import 'package:flutter_application_3/home_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int selectedPage = 0;

  List<Widget> pages = [
    const HomePage(),
    const BookedPage(),
  ];

  @override
  void initState() {
    selectedPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      theme: ThemeData(
        colorSchemeSeed: Colors.green[500],
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: Scaffold(
        body: pages.elementAt(selectedPage),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (val) {
            setState(() {
              selectedPage = val;
            });
          },
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Browse',
            ),
            NavigationDestination(
              icon: Icon(Icons.book_online_rounded),
              label: 'Booked',
            ),
          ],
          selectedIndex: selectedPage,
        ),
      ),
    );
  }
}
