import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocerybasket/model/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<CartModel>(
      builder: (context, value, child) {
        return SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 24,
                  bottom: 0,
                  left: 0,
                  right: 0,
                ),
                child: Text(
                  "My Cart",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),

              Expanded(
                  child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: value.cartItems.length,
                padding: const EdgeInsets.all(12),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(20)),
                      child: ListTile(
                        leading: Image.asset(
                          value.cartItems[index][2],
                          height: 35,
                        ),
                        title: Text(
                          value.cartItems[index][0],
                          style: GoogleFonts.poppins(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),

                        // ignore: prefer_interpolation_to_compose_strings
                        subtitle: Text(
                          '₹ ' + value.cartItems[index][1],
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.cancel_outlined,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          onPressed: () =>
                              Provider.of<CartModel>(context, listen: false)
                                  .removeItemFromCart(index),
                        ),
                      ),
                    ),
                  );
                },
              )),

              // total + pay now
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price ",
                            style: GoogleFonts.poppins(
                              color: Colors.green[100],
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '₹ ${value.calculateTotal()}',
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      // pay now button
                      Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            border: Border.all(
                              color: Colors.green.shade100,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Text(
                              "Pay Now",
                              style: GoogleFonts.poppins(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 18,
                              color: Theme.of(context).colorScheme.tertiary,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
