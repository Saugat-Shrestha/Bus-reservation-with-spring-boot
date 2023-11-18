import 'package:bus_reservation/utils/constants.dart';
import 'package:bus_reservation/utils/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String? fromCity, toCity;
  DateTime? depatureDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Form(
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(8),
            children: [
              DropdownButtonFormField<String>(
                value: fromCity,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
                hint: Text("From"),
                items: cities
                    .map(
                      (city) => DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  fromCity = value;
                },
              ),
              Gap(10),
              DropdownButtonFormField<String>(
                value: toCity,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return emptyFieldErrMessage;
                  }
                  return null;
                },
                hint: Text("to"),
                items: cities
                    .map(
                      (city) => DropdownMenuItem(
                        value: city,
                        child: Text(city),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  toCity = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: _selectDate,
                      child: Text("Select Departure Date"),
                    ),
                    Text(depatureDate == null
                        ? "No date Chosen"
                        : getFormattedDate(depatureDate!,
                            pattern: 'EEE MM dd, yyyy')),
                  ],
                ),
              ),
              ElevatedButton(onPressed: _search, child: Text("Search"))
            ],
          ),
        ),
      ),
    );
  }

  void _selectDate() async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 7)),
    );
    if (selectedDate != null) {
      setState(() {
        depatureDate = selectedDate;
      });
    }
    ;
  }

  void _search() {}
}
