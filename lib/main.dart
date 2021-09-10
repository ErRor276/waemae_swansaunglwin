import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'MyHomePage.dart';
import 'constants/colors.dart';

void main() {
  /***************************************************
      You can either add some code below or
      create a new file.
   ***************************************************/
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Waemae Jobs Finder',
      theme: ThemeData(
          primarySwatch: Colors.blue, scaffoldBackgroundColor: BgColor),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
