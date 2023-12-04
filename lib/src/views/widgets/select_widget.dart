import 'package:flutter/material.dart';

class SelectWidget extends StatefulWidget {
  const SelectWidget({
    super.key,
    required this.list,
    required this.onChanged,
    required this.value,
  });
  final List<String> list;
  final Function(String) onChanged;
  final String value;

  @override
  State<SelectWidget> createState() => _SelectWidgetState();
}

class _SelectWidgetState extends State<SelectWidget> {
  late String selectValue;
  @override
  void initState() {
    super.initState();
    selectValue = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        widget.onChanged(value!);
        setState(() {
          selectValue = value;
        });
      },
      items: widget.list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
