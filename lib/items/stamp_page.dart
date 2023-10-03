import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StampPage extends StatefulWidget {
  const StampPage({super.key});

  @override
  State<StampPage> createState() => _StampPageState();
}

class _StampPageState extends State<StampPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Colors.blueGrey[700]));
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      body: const Center(
        child: Text("This is a Stamp page",style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
