import 'package:flutter/material.dart';
import '../style/my_colors.dart';

class MyDropDown extends StatelessWidget {
  final Function(String) onChanged;
  final String title;
  final List<String> selectedAbleList;
  final bool isRequired;
  final Map<String, dynamic>? dictionary;

  MyDropDown({
    required this.title,
    required this.isRequired,
    required this.onChanged,
    required this.selectedAbleList,
    this.dictionary,
    super.key,
  });

  final ValueNotifier<String?> _value = ValueNotifier(null);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _value,
      builder: (context, value, widget) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: MyColors.grey700,
                  ),
                ),
                if (isRequired)
                  Text(
                    '*',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: MyColors.errorColor,
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  borderSide: BorderSide(width: 1, color: Colors.black),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('Cонгох'),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(16),
                  value: _value.value,
                  onChanged: (choose) {
                    onChanged(choose ?? '');
                    _value.value = choose;
                  },
                  dropdownColor: Colors.white,
                  elevation: 8,
                  items: selectedAbleList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text('${dictionary != null ? dictionary!['${value}'] ?? '${value}' : value}'),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
