import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Image Example')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/2.jpeg', width: 200, height: 200),
              const SizedBox(height: 20),
              buildStack(),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('SnackBar Shown!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Цвет кнопки
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  "Show SnackBar",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SecondScreen()),
                  );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  "Go to Second Screen",
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset('assets/images/1.jpg', width: 200, height: 200),
        Container(
          width: 200,
          height: 50,
          color: Colors.black.withOpacity(0.5),
        ),
        const Text(
          "Welcome to Flutter",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Second Screen')),
      body: const Center(
        child: Text("Welcome to Second Screen!", style: TextStyle(fontSize: 18)),
      ),
    );
  }
}