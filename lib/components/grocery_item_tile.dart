import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

  GroceryItemTile({
    super.key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // image paths
            Image.asset(
              imagePath,
              height: 64,
            ),

            // item names
            Text(
              itemName,
              style: GoogleFonts.poppins(
                  color: Theme.of(context).colorScheme.primary),
            ),

            // price + button
            // MaterialButton(
            //   onPressed: onPressed,
            //   color: color[800],
            //   child: Text(
            //     '₹ $itemPrice',
            //     style: TextStyle(
            //       color: Theme.of(context).colorScheme.secondary,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            TextButton(
              onPressed: onPressed,
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(
                  color[800],
                ),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              // color: Colors.pink,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
                child: Text(
                  '₹ $itemPrice',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
