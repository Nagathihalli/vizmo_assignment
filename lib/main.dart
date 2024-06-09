import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:untitled/data/services/event_service.dart';
import 'package:untitled/ui/calender_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EventsViewModel(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const CalenderPage(),
        ));
  }
}
