import 'package:flutter/material.dart';

class WgFormTextField extends StatefulWidget {
  final String prop;
  final String? errorMessage;
  final TextEditingController txtController;
  final Icon? icono;
  final TextInputType inputType;
  final bool isPassword;
  final void Function(String value)? $onChanged;
  const WgFormTextField({
    super.key,
    required this.prop,
    required this.txtController,
    required this.inputType,
    this.icono,
    this.isPassword = false,
    this.$onChanged,
    this.errorMessage,
  });

  @override
  State<WgFormTextField> createState() => _WgFormTextFieldState();
}

class _WgFormTextFieldState extends State<WgFormTextField> {
  bool isVisiblePassword = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.prop,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            onChanged: widget.$onChanged,
            obscureText: widget.isPassword?!isVisiblePassword:false,
            keyboardType: widget.inputType,
            controller: widget.txtController,
            decoration: InputDecoration(
              hintText: "Ingrese ${widget.prop.toLowerCase()}",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: const BorderSide(color: Colors.black87),
              ),
              suffixIcon: !widget.isPassword
                  ? widget.icono
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          isVisiblePassword = !isVisiblePassword;
                        });
                      },
                      icon: isVisiblePassword
                          ? const Icon(Icons.visibility, size: 28)
                          : const Icon(Icons.visibility_off, size: 28),
                    ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide(color: Colors.blue.shade400),
              ),
            ),
            validator: (data) {
              if (data!.isEmpty) {
                return widget.errorMessage ?? '${widget.prop}  requerido';
              }
              return null;
            },
          )
        ],
      ),
    );
  }
}
