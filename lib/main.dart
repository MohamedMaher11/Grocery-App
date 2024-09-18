import 'package:coffeshop/Componant/cart.dart';
import 'package:coffeshop/Fruit/intropage.dart';

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    DevicePreview(
      builder: (context) => ChangeNotifierProvider(
        create: (context) => Cartmodel(),
        child: MaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner:
              false, // استخدم MediaQuery من DevicePreview
          home: IntroPage(),
          builder: DevicePreview.appBuilder, // غلف التطبيق بـ DevicePreview
        ),
      ),
    ),
  );
}
