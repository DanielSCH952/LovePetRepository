import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class WgCustomDropdown1 extends StatelessWidget {
  const WgCustomDropdown1({
    super.key,
    required this.$titulo,
    required this.$items,
    this.$placeholder,
    this.$nullErrorMessage,
    this.$selectedValue,
    this.$onChanged,
  });
  final String $titulo;
  final String? $placeholder;
  final String? $nullErrorMessage;
  final String? $selectedValue;
  final List<String> $items;
  final Function(String? value)? $onChanged;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.5, vertical: 10.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            $titulo,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          DropdownButtonFormField2<String>(
            isExpanded: true,
            decoration: InputDecoration(
              // Add Horizontal padding using menuItemStyleData.padding so it matches
              // the menu padding when button's width is not specified.
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              // Add more decoration..
            ),
            hint: Text(
              $placeholder ?? 'Select ${$titulo}',
              style: const TextStyle(fontSize: 14),
            ),
            items: $items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return $nullErrorMessage ??
                    'Please select ${$titulo}';
              }
              return null;
            },
            onChanged: $onChanged,
            onSaved: $onChanged,
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.only(right: 8),
            ),
            iconStyleData: const IconStyleData(
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 24,
            ),
            dropdownStyleData: DropdownStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
            ),
          )
        ],
      ),
    );
  }
}
