import 'package:flutter/cupertino.dart';

class CustomSubTitleWidget extends StatelessWidget {
  final String text;

  const CustomSubTitleWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
