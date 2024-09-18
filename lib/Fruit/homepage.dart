import 'package:coffeshop/Componant/GrocyItemTile.dart';
import 'package:coffeshop/Componant/cart.dart';
import 'package:coffeshop/Fruit/cartpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyHomepage extends StatefulWidget {
  const MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return Cart();
          }));
        },
        child: Icon(
          Icons.shopping_bag,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 48,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("Good Morning"),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Lets order fresh items for you ",
                style: GoogleFonts.notoSerif(
                    fontSize: 36, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Divider(),
            ),
            const SizedBox(height: 24),
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                  "Fresh Items",
                  style: TextStyle(fontSize: 16),
                )),
            Expanded(child: Consumer<Cartmodel>(
              builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopitem.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1 / 1.3, crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return GrocyItemTile(
                        name: value.shopitem[index][0],
                        price: value.shopitem[index][1],
                        image: value.shopitem[index][2],
                        color: value.shopitem[index][3],
                        onPressed: () {
                          Provider.of<Cartmodel>(context, listen: false)
                              .create_cart(index);
                          print(index);
                        });
                  },
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
