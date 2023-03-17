import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerybasket/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.only(
              left: 80, 
              right: 80,
              bottom: 50,
              top: 100
            ),
            child: Image.asset('lib/images/shopping-bag.png'),
          ),

          // we deliver groceries at your doorsteps
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'We deliver groceries at your doorsteps',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                height: 1.2,
              ),
            ),
          ),

          const SizedBox(height: 24,),
          
          // fresh item everyday
          Text(
            "GroceryBasket gives you fresh vegetables and fruits.          Order fresh items from groceer.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[600],
              height: 1.5,
            ),
          ),

          const Spacer(),

          // get started button
          GestureDetector(
            onTap: ()=> Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                  return const HomePage();
                },
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(50),
              ),
              padding: const EdgeInsets.all(24),
              child:  Text(
                "Get Started",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
                ),
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}