import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              style: GoogleFonts.poppins(),
            ),

            // price + button
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                  '₹ $itemPrice',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
} 