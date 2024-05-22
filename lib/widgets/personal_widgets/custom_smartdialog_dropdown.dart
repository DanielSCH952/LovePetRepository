import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class WgCustomSmartDropdown extends StatefulWidget {
  const WgCustomSmartDropdown({
    super.key,
    required this.titulo,
    this.selectedValue = "",
    this.listItems = const [],
    this.listWigets = const [],
  });
  final String titulo;
  final String selectedValue;
  final List<String> listItems;
  final List<Widget> listWigets;

  @override
  State<WgCustomSmartDropdown> createState() => _WgCustomSmartDropdownState();
}

class _WgCustomSmartDropdownState extends State<WgCustomSmartDropdown> {
  double heightState = 50.57;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.4, horizontal: 8.5),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(width: 1.0, color: Colors.black),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Builder(
          builder: (context) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        widget.titulo,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.selectedValue,
                        style: TextStyle(
                          fontSize: 14.76,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey.shade600,
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    imitateDialog(
                      context: context,
                      listItems: widget.listItems,
                      listWigets: widget.listWigets,
                    );
                  },
                  child: Container(
                    height: 58,
                    width: double.infinity,
                    color: Colors.transparent,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget dropdownButton({String title = 'Dropdown'}) {
    return DropdownButton<String>(
      value: '1',
      items: [
        DropdownMenuItem(
          value: '1',
          alignment: Alignment.centerLeft,
          child: Text(title),
        ),
      ],
      onChanged: (value) {},
    );
  }

  imitateDialog({
    required BuildContext context,
    List<String> listItems = const [],
    List<Widget> listWigets = const [],
  }) {
    SmartDialog.showAttach(
      targetContext: context,
      targetBuilder: (targetOffset, targetSize) =>
          targetOffset.translate(00.00, -150.00),
      usePenetrate: true,
      builder: (_) {
        return Container(
          height: 100,
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 8, spreadRadius: 0.2)
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: listItems.isNotEmpty && listWigets.isNotEmpty
                ? []
                : listItems.isEmpty && listWigets.isNotEmpty
                    ? List.generate(
                        listWigets.length,
                        (index) {
                          return Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () => SmartDialog.dismiss(),
                              child: Container(
                                height: 50,
                                width: 210,
                                alignment: Alignment.center,
                                child: listWigets[index],
                              ),
                            ),
                          );
                        },
                      )
                    : listItems.isNotEmpty && listWigets.isEmpty
                        ? List.generate(
                            listItems.length,
                            (index) {
                              return Material(
                                color: Colors.white,
                                child: InkWell(
                                  onTap: () => SmartDialog.dismiss(),
                                  child: Container(
                                    height: 50,
                                    width: 210,
                                    alignment: Alignment.center,
                                    child: Text(listItems[index]),
                                  ),
                                ),
                              );
                            },
                          )
                        : [],
          ),
        );
      },
    );
  }
}
