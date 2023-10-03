import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: Colors.blueGrey[700]));
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      body: const Center(
        child: Text("This is a Community page",style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
