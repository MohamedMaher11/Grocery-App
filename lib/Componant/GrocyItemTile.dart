import 'package:flutter/material.dart';

class GrocyItemTile extends StatelessWidget {
  final String name;
  final String price;
  final String image;
  final color;
  void Function()? onPressed;
  GrocyItemTile(
      {super.key,
      required this.name,
      required this.price,
      required this.image,
      this.color,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color[100], borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              height: 64,
            ),
            Text(name),
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                '\$' + price,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
