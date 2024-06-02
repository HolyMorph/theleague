import 'package:flutter/material.dart';
import '../../../../style/my_colors.dart';

class TeamDropDown extends StatelessWidget {
  final Function(dynamic) onChanged;
  final String title;
  final List<dynamic> selectedAbleList;
  final bool isRequired;
  final Map<String, dynamic>? dictionary;

  TeamDropDown({
    required this.title,
    required this.isRequired,
    required this.onChanged,
    required this.selectedAbleList,
    this.dictionary,
    super.key,
  });

  final ValueNotifier<dynamic> _value = ValueNotifier(null);

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
                child: DropdownButton<dynamic>(
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
                  items: selectedAbleList.map((dynamic value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text('${value['name']}'),
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
