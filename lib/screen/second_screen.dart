import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Second Screen'))),
      body: Column(
        spacing: 20,
        children: [
          Text(Get.arguments ?? ""),
          Text('Device : ${Get.parameters['device'] ?? ''}'),
          Text('ID : ${Get.parameters['Id'] ?? ''}'),
          Text('Name : ${Get.parameters['name'] ?? ''} '),
          Text('Name-1 : ${Get.parameters['userId'] ?? ''}'),
          ElevatedButton(
            onPressed: () {},
            child: Center(child: Text("Simple Back Screen")),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Center(child: Text("Getx Back Screen")),
          ),
        ],
      ),
    );
  }
}
