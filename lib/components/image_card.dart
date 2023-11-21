import 'package:flutter/material.dart';
import 'package:namhla2/booking_page.dart';


class ImageCard extends StatelessWidget {
  final String imagePath;

  const ImageCard({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
        ),
       Positioned(
          bottom: 30, // Adjust the bottom distance as needed
          right: 40, // Adjust the right distance as needed
          child: Container(
            width: 100, // Adjust the width as needed
            height: 40, // Adjust the height as needed
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white, // Change the border color as needed
                width: 2, // Adjust the border width as needed
              ),
            ),
            child: TextButton(
              onPressed: () {
               Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingPage(),
        ),
      );
              },
              child: Text(
                'Book Now',
                style: TextStyle(
                  color: Colors.white, // Change the text color as needed
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 100,
          left: 30,
          child: Text(
            'Swipe Left >>\nTo view more of our catalogue',
            style: TextStyle(
              fontSize: 15, // Adjust the font size as needed
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
          ),
        ),
      ],
    );
  }
}
