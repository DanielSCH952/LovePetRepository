import 'package:flutter/material.dart';
import 'package:lovepet/extension/sized_box_extension.dart';
import 'package:lovepet/models/estado.dart';
import 'package:lovepet/models/municipio.dart';
import 'package:lovepet/services/services.dart';
import 'package:lovepet/widgets/personal_widgets/formtextfield.dart';

class WgFormView3 extends StatefulWidget {
  const WgFormView3({
    super.key,
    required this.txtCodigoPostalController,
    required this.txtEdadUsuarioController,
    required this.$onChangeMunicipio,
    required this.$onChangeEstado,
    this.estado,
  });
  final TextEditingController txtEdadUsuarioController;
  final TextEditingController txtCodigoPostalController;
  final void Function(Municipio)? $onChangeMunicipio;
  final void Function(Estado)? $onChangeEstado;
  final Estado? estado;
  @override
  State<WgFormView3> createState() => _WgFormView3State();
}

class _WgFormView3State extends State<WgFormView3> {
  final Future<List<Estado>> futureEstados = getEstadosList();
  final Future<List<Municipio>> futureMunicipios = getMunicipiosList();
  static String _displayStringForOptionEstado(Estado est) => est.estado;
  static String _displayStringForOptionMunicipio(Municipio m) => m.municipio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
         padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              const Text(
                "Dirección",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              9.kH,
              WgFormTextField(
                prop: 'Codigo Postal',
                errorMessage: "Necesita registrar su codigo postal",
                txtController: widget.txtCodigoPostalController,
                inputType: TextInputType.number,
              ),
              FutureBuilder(
                future: futureEstados,
                builder: (context, snapshot) {
                  return Autocomplete<Estado>(
                    displayStringForOption: _displayStringForOptionEstado,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '' ||
                          snapshot.hasError ||
                          !snapshot.hasData) {
                        return const Iterable<Estado>.empty();
                      }
                      final lst = snapshot.data ?? [];
                      return lst.where((Estado est) {
                        return est
                            .toString()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: widget.$onChangeEstado,
                    fieldViewBuilder:
                        (context, controller, focusNode, onFieldSubmitted) {
                      return WgFormTextField(
                        prop: 'Estado',
                        errorMessage:
                            "Necesita selecionar su estado de residencia actual",
                        txtController: controller,
                        inputType: TextInputType.text,
                      );
                    },
                  );
                },
              ),
              FutureBuilder(
                future: getMunicipiosList(),
                builder: (context, snapshot) {
                  return Autocomplete<Municipio>(
                    displayStringForOption: _displayStringForOptionMunicipio,
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '' ||
                          snapshot.hasError ||
                          !snapshot.hasData) {
                        return const Iterable<Municipio>.empty();
                      }
                      final lst = snapshot.data ?? [];
                      return lst.where((Municipio m) {
                        return m
                            .toString()
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: widget.$onChangeMunicipio,
                    fieldViewBuilder:
                        (context, controller, focusNode, onFieldSubmitted) {
                      return WgFormTextField(
                        prop: 'Municipio',
                        errorMessage:
                            "Necesita selecionar su municipio de residencia actual",
                        txtController: controller,
                        inputType: TextInputType.text,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
