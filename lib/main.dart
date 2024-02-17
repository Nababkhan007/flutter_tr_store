import 'package:flutter/material.dart';

void main() {
  runApp(const TRStore());
}

class TRStore extends StatelessWidget {
  const TRStore({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "TR Store",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("TR Store"),
        ),
        body: const Center(),
      ),
    );
  }
}
