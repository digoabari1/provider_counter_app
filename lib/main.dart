import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AgeScreen(),
    );
  }
}

class AgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterProvider = Provider.of<CounterProvider>(context);

    return Scaffold(
      backgroundColor: counterProvider.getBackgroundColor(), // Change background color
      appBar: AppBar(title: Text("Age Slider")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Age: ${counterProvider.age}",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: counterProvider.age.toDouble(),
              min: 0,
              max: 99,
              divisions: 99,
              label: "${counterProvider.age}",
              onChanged: (value) {
                counterProvider.setAge(value.toInt()); // Update age
              },
            ),
            Text(counterProvider.age < 12 ? "You are a child!" : counterProvider.age < 19 ? "Teenager Time!" : counterProvider.age < 30 ? "You're a young adult!" : counterProvider.age < 50 ? "You're an adult now!" : "Golden Years!", style: TextStyle(fontSize: 24),)
          ],
        ),
      ),
    );
  }
}
