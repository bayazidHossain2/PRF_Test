import 'package:flutter/material.dart';

class CustomDropdownWidget extends StatefulWidget {
  final List<String> options;
  final TextEditingController controller;
  final String label;
  final String hintText;
  final Function()? onChanged;

  // final IconData prefixIcon;

  const CustomDropdownWidget({
    super.key,
    required this.options,
    required this.controller,
    required this.label,
    required this.hintText,
    this.onChanged,
    // this.prefixIcon = Icons.business,
  });

  @override
  State<CustomDropdownWidget> createState() => _CustomDropdownWidgetState();
}

class _CustomDropdownWidgetState extends State<CustomDropdownWidget> {
  @override
  Widget build(BuildContext context) {
    // if (widget.controller.text == '') {
    //   widget.controller.text = widget.options[0];
    // }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 4),
        Container(
          // width: MediaQuery.of(context).size.width * 0.9,
          width: double.infinity,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 1),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(widget.hintText, overflow: TextOverflow.ellipsis),
              // Placeholder text
              value: widget.controller.text.isEmpty
                  ? null
                  : widget.controller.text,
              // Currently selected value
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              // Dropdown icon
              elevation: 16,
              // Dropdown elevation
              style: const TextStyle(
                // color: AppPallete.black,
                fontSize: 13,
              ),

              // Text style
              onChanged: (String? newValue) async {
                setState(() {
                  widget.controller.text = newValue!;
                  print('----ch $newValue ');
                });
                if (widget.onChanged != null) {
                  widget.onChanged!();
                }
              },
              items: widget.options.map<DropdownMenuItem<String>>((
                String value,
              ) {
                print('----ha ha ha $value ');
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyMedium?.color,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
