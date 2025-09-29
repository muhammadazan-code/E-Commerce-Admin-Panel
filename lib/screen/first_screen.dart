import 'package:e_commerce_web/screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("First Screen"))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 10,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Simple Navigations Default Flutter Navigator VS Getx Navigations",
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const SecondScreen(),
                    ),
                  );
                },
                child: Center(child: Text("Default Navigations")),
              ),
              ElevatedButton(
                onPressed: () => Get.to(() => const SecondScreen()),
                child: Center(child: Text("Getx Navigations")),
              ),
              Divider(),

              /// Named Navigations
              Text(
                "Named Navigations Flutter Navigator VS Getx Named Navigations",
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/second-screen');
                },
                child: Center(child: Text("Default Named Navigations")),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed('/second-screen'),
                child: Center(child: Text("Getx Named Navigations")),
              ),
              Divider(),

              /// Pass Data
              Text("Pass Data between screens - Getx"),
              ElevatedButton(
                onPressed: () => Get.toNamed(
                  '/second-screen',
                  arguments: "Getx is fun with CwA",
                ),
                child: Center(child: Text("Getx Pass Data")),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/second-screen?device=phone&Id=345&name=Vivo');
                },
                child: Center(child: Text("Pass Data in URL 0")),
              ),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed('/second-screen/123');
                },
                child: Center(child: Text("Pass Data in URL")),
              ),

              ElevatedButton(
                onPressed: () {
                  Get.toNamed(
                    '/second-screen?device=phone&Id=345&name=Vivo',
                    arguments: "Get is fun with CwA",
                  );
                },
                child: Center(child: Text("Pass Data URL with arguments")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
