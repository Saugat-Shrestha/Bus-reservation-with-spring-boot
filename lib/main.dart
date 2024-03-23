import 'package:bus_reservation/pages/search_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const busreservation());
}

class busreservation extends StatelessWidget {
  const busreservation({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bus Reservation",
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        brightness: Brightness.light,
      ),
      home: const SearchPage(),
    );
  }
}
