import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import './providers/office_provider.dart';
import 'screens/landing_page.dart';

void main() {
  sqfliteFfiInit();
  databaseFactory = databaseFactoryFfi;
  runApp(OfficeDynasty());
}

class OfficeDynasty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => OfficeProvider()),
      ],
      child: MaterialApp(
        title: 'OfficeDynasty',
        theme: ThemeData(
          useMaterial3: false,
          fontFamily: GoogleFonts.inter().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LandingPage(),
        },
      ),
    );
  }
}
