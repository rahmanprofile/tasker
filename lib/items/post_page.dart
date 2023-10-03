import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PagePage extends StatefulWidget {
  const PagePage({super.key});

  @override
  State<PagePage> createState() => _PagePageState();
}

class _PagePageState extends State<PagePage> {
  List<String> imageList = [
    "https://resize.indiatvnews.com/en/resize/newbucket/1200_-/2016/10/mota-ru-cute-dog-1477384405.jpg",
    "https://dogbreedo.com/wp-content/uploads/2018/12/pomeranian-big-1.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(systemNavigationBarColor: Colors.blueGrey[700]));
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade700,
      body: GridView.builder(
        itemCount: imageList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          return Image.network(
            imageList[index],
            filterQuality: FilterQuality.low,
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}
