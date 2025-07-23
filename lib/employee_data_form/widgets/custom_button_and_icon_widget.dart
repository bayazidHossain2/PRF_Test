import 'package:flutter/material.dart';

class CustomButtonAndIconWidget extends StatelessWidget {
  final Function() onPress;
  final String text;
  final IconData icon;

  const CustomButtonAndIconWidget({
    super.key,
    required this.onPress,
    required this.text,
    this.icon = Icons.arrow_forward_ios,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 48,
        width: 156,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
              Icon(icon, size: 20, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
