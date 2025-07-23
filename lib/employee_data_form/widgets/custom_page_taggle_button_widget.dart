import 'package:flutter/material.dart';

class CustomPageTaggleButtonWidget extends StatefulWidget {
  final List<String> pageTitleList;

  const CustomPageTaggleButtonWidget({super.key, required this.pageTitleList});

  @override
  State<CustomPageTaggleButtonWidget> createState() =>
      _CustomPageTaggleButtonWidgetState();
}

class _CustomPageTaggleButtonWidgetState
    extends State<CustomPageTaggleButtonWidget> {
  String _selected = '';

  @override
  void initState() {
    _selected = widget.pageTitleList[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: widget.pageTitleList
          .map(
            (e) => Expanded(
              child: (_selected == e)
                  ? GradientBtn(
                      text: e,
                      onPress: () {
                        _onPress(e);
                      },
                    )
                  : DisselectedBtn(
                      text: e,
                      onPress: () {
                        _onPress(e);
                      },
                    ),
            ),
          )
          .toList(),
    );
  }

  _onPress(String e) {
    setState(() {
      _selected = e;
    });
  }
}

class GradientBtn extends StatelessWidget {
  final String text;
  final Function() onPress;

  const GradientBtn({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF007781), // Top color
              Color(0xFF002F33), // Bottom color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}

class DisselectedBtn extends StatelessWidget {
  final String text;
  final Function() onPress;

  const DisselectedBtn({super.key, required this.text, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
