import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:namhla2/booking_page.dart';


class SecondTab extends StatefulWidget {
  const SecondTab({super.key});

  @override
  State<SecondTab> createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  final PageController controller = PageController();
 
 


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      
      body: MasonryGridView.builder(
          itemCount: 7, 
  gridDelegate: SliverSimpleGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
  ),
  itemBuilder: (context, index) => GestureDetector(
    onTap: () {
      // Navigate to a new page with the unique data for the selected tile
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BookingPage(),
        ),
      );
    },
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset('lib/images/image${index + 1}.jpg'),
       
        ],
      ),
    ),
  ),
),

    );
  }
}
