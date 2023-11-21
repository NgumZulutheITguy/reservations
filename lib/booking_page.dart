import 'package:flutter/material.dart';
import 'package:namhla2/components/button.dart';
import 'package:namhla2/components/formField.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  String? selectedValue; // Default selected value

  // List of items for the dropdown
  List<String?> dropdownItems = [
    null,
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
  ];

  String? selectedDate;
  String? selectedTime;

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
      if (value != null) {
        setState(() {
          selectedTime = value.format(context);
        });
      }
    });
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2045),
    ).then((value) {
      if (value != null) {
        setState(() {
          selectedDate = value.toString(); // You can format this date as needed
        });
      }
    });
  }

  void _makeBooking() {
    if (selectedValue != null && selectedDate != null && selectedTime != null) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Booking Confirmation'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Selected Option: $selectedValue'),
                Text('Selected Date: $selectedDate'),
                Text('Selected Time: $selectedTime'),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Handle the case when not all required fields are filled
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please fill in all required fields.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          // Logo
          const SizedBox(height: 10),

          const Text('Photoshoot Packages'),
          MyFormField(
            hintText: 'Choose an option',
            obscureText: false,
            dropdownItems: const ['Option 1', 'Option 2', 'Option 3'],
            selectedValue: selectedValue,
            onChanged: (String? value) {
              setState(() {
                selectedValue = value;
              });
            },
          ),
          const SizedBox(height: 15),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 150, // Adjust the width as per your preference
                child: MaterialButton(
                  onPressed: _showDatePicker,
                  color: Colors.indigo,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Choose Date',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              // Time button

              SizedBox(
                width: 150, // Adjust the width as per your preference
                child: MaterialButton(
                  onPressed: _showTimePicker,
                  color: Colors.indigo,
                  child: const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Choose Time',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          MyButton(
            onTap: _makeBooking, // Call the _makeBooking function
            buttonText: 'Make a booking',
          )
        ],
      ),
    );
  }
}
