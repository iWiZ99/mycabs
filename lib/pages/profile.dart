import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  final String name;
  final String urlImage;

  const profile({
    Key? key,
    required this.name,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.pink,
      title: Text(name),
      centerTitle: true,
    ),
    body: Image.network(
      urlImage,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    ),
  );
}