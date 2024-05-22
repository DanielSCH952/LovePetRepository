import 'package:flutter/material.dart';

class WgDropdown extends StatefulWidget {
  final String $titulo;
  final List<Widget> $items;
  final String? $selectedItem;
  const WgDropdown({
    super.key,
    required this.$titulo,
    required this.$items,
    this.$selectedItem,
  });

  @override
  State<WgDropdown> createState() => _WgDropdownState();
}

class _WgDropdownState extends State<WgDropdown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsetsDirectional.symmetric(horizontal: 7.4, vertical: 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.$titulo,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          ExpansionTile(
            expandedCrossAxisAlignment: CrossAxisAlignment.center,
            childrenPadding: const EdgeInsets.symmetric(
              horizontal: 28,
              vertical: 4.5,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            collapsedShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text(widget.$selectedItem ?? ""),
            initiallyExpanded: false,
            expandedAlignment: Alignment.centerLeft,
            children: widget.$items,
          ),
        ],
      ),
    );
  }
}
