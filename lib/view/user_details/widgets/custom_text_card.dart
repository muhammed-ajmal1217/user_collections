import 'package:flutter/cupertino.dart';

class CustomTextCard extends StatelessWidget {
  const CustomTextCard({
    super.key,
    required this.text,
    required this.title,
  });

  final String text;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 239, 238, 238),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('$title : $text'),
      ));
  }
}