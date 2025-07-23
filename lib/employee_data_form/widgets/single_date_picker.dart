import 'package:flutter/material.dart';

class SingleDateTimePicker extends StatefulWidget {
  final TextEditingController controller;
  final String text;
  final String purpose;

  const SingleDateTimePicker({
    super.key,
    required this.controller,
    required this.text,
    required this.purpose,
  });

  @override
  State<SingleDateTimePicker> createState() => _SingleDateTimePickerState();
}

class _SingleDateTimePickerState extends State<SingleDateTimePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: (widget.controller.text != '') ? Colors.grey : Colors.red,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListTile(
        title: Text(
          widget.controller.text != ''
              ? '${widget.text} : ${widget.controller.text}'
              : '${widget.text} ?',
        ),
        trailing: Icon(Icons.calendar_today),
        onTap: () async {
          DateTime? _selectedDate;
          final DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: _selectedDate ?? DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2101),
          );
          if (pickedDate != null) {
            setState(() {
              widget.controller.text =
                  '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
            });
          }
        },
      ),
    );
  }
}
