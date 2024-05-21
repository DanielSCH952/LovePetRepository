import 'package:flutter/material.dart';

import 'package:lovepet/extension/sized_box_extension.dart';
import 'package:lovepet/models/estado.dart';
import 'package:lovepet/models/municipio.dart';
import 'package:lovepet/services/router.dart';
import 'package:lovepet/services/services.dart';
import 'package:lovepet/widgets/custom_dropdown2.dart';
import 'package:lovepet/widgets/formtextfield.dart';
import 'package:lovepet/widgets/page_indicator_widget.dart';

final lstGeneros = [
  {
    "genero": "Masculino",
    "idGenero": 1,
    "key": "M",
  },
  {
    "genero": "Femenino",
    "idGenero": 2,
    "key": "F",
  },
];

class AccountRegistrationPage extends StatefulWidget {
  const AccountRegistrationPage({super.key});

  @override
  State<AccountRegistrationPage> createState() =>
      _AccountRegistrationPageState();
}

class _AccountRegistrationPageState extends State<AccountRegistrationPage>
    with TickerProviderStateMixin {
  late AnimateRouter _router;
  final formKey = GlobalKey<FormState>();
  late PageController _pageViewController;
  late TabController _tabController;

  late List<Widget> _wgListViews;

  int $currentIndexWidget = 0;

  //Datos usuarario
  final txtNombreUsuario = TextEditingController();
  final txtApptUsuarioController = TextEditingController();
  final txtApmtUsuarioController = TextEditingController();
  final txtEdadUsuarioController = TextEditingController();
  final txtTelefonoUsuarioController = TextEditingController();
  final txtCorreoUsuarioController = TextEditingController();
  final txtPwdUsuarioController = TextEditingController();
  final txtPwdUsuarioCheckController = TextEditingController();
  final txtCodigoPostalController = TextEditingController();

  String? generoUsuario;
  Estado? estadoUsuario;
  Municipio? municipio;

  bool show = false;
  bool showPassword = false;
  bool personalDataValidated = false;

  void $selectGenero(String? g) {
    setState(() {
      generoUsuario = g;
    });
  }

  void $onSelectedEstado(Estado estado) {
    setState(() {
      estadoUsuario = estado;
    });
  }

  void $onSelectedMunicipio(Municipio m) {
    setState(() {
      municipio = m;
    });
  }

  @override
  void initState() {
    super.initState();
    _wgListViews = <Widget>[
      WgFormView1(
        txtNombreUsuario: txtNombreUsuario,
        txtApptUsuarioController: txtApptUsuarioController,
        txtApmtUsuarioController: txtApmtUsuarioController,
      ),
      WgFormView2(
        txtEdadUsuarioController: txtEdadUsuarioController,
        txtTelefonoController: txtTelefonoUsuarioController,
        $changeGenero: $selectGenero,
      ),
      WgFormView3(
        txtCodigoPostalController: txtCodigoPostalController,
        $onChangeMunicipio: $onSelectedMunicipio,
        $onChangeEstado: $onSelectedEstado,
        estado: estadoUsuario,
      ),
      WgFormView4(
        txtCorreoUsuarioController: txtCorreoUsuarioController,
        txtPwdUsuarioController: txtPwdUsuarioController,
        txtPwdUsuarioCheckController: txtPwdUsuarioCheckController,
      ),
    ];

    _pageViewController = PageController(
      initialPage: 0,
    );

    _tabController = TabController(
      length: _wgListViews.length,
      vsync: this,
      initialIndex: 0,
    );
    _router = AnimateRouter();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  bool isUserDataValidated() {
    return txtNombreUsuario.text.isNotEmpty &&
        txtApptUsuarioController.text.isNotEmpty &&
        txtApmtUsuarioController.text.isNotEmpty &&
        txtCorreoUsuarioController.text.isNotEmpty &&
        txtPwdUsuarioController.text.isNotEmpty;
  }

  void _handlePageViewChanged(int? currentPageIndex) {
    if (currentPageIndex == null) return;
    setState(() {
      _tabController.index = currentPageIndex;
      $currentIndexWidget = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    if ($currentIndexWidget == index) return;

    setState(() {
      $currentIndexWidget = index;
    });
    _tabController.index = $currentIndexWidget;
    _pageViewController.animateToPage(
      $currentIndexWidget,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  Widget _wgButtonGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            if ($currentIndexWidget == 0) {
              Navigator.of(context).pushAndRemoveUntil(
                _router.createRoute("/",),
                (route) => false,
              );
              return;
            } else {
              _updateCurrentPageIndex($currentIndexWidget - 1);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            elevation: 5,
          ),
          child: const Text(
            'Cancelar',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        30.kW,
        ElevatedButton(
          onPressed: () {
            if ($currentIndexWidget == _wgListViews.length) return;
            _updateCurrentPageIndex($currentIndexWidget + 1);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            elevation: 5,
          ),
          child: Text(
            $currentIndexWidget == _wgListViews.length - 1
                ? "Finalizar"
                : 'Siguiente',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: WgMainBody(
          $currentIndex: $currentIndexWidget,
          pageViewController: _pageViewController,
          tabController: _tabController,
          wgButtonGroup: _wgButtonGroup(),
          wgListViews: _wgListViews,
          handlePageViewChanged: _handlePageViewChanged,
        ),
      ),
    );
  }
}

class WgMainBody extends StatelessWidget {
  const WgMainBody({
    super.key,
    required this.tabController,
    required this.handlePageViewChanged,
    required this.pageViewController,
    required this.wgButtonGroup,
    required this.wgListViews,
    required this.$currentIndex,
  });
  final TabController tabController;
  final PageController pageViewController;
  final int $currentIndex;
  final List<Widget> wgListViews;
  final Widget wgButtonGroup;
  final void Function(int? index) handlePageViewChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        20.kH,
        Text(
          'Información personal',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        15.kH,
        ClipRRect(
          borderRadius: BorderRadius.circular(200.0),
          child: Image.asset(
            'assets/LogoVideo.gif',
            width: 185,
            height: 185,
            fit: BoxFit.cover,
          ),
        ),
        5.kH,
        PageIndicator(
          tabController: tabController,
          currentPageIndex: $currentIndex,
        ),
        9.kH,
        Expanded(
          flex: 1,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              PageView(
                pageSnapping: true,
                allowImplicitScrolling: true,
                physics: const NeverScrollableScrollPhysics(),
                controller: pageViewController,
                onPageChanged: handlePageViewChanged,
                children: wgListViews,
              ),
              Positioned(
                bottom: 90,
                child: wgButtonGroup,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class WgFormView1 extends StatelessWidget {
  const WgFormView1({
    super.key,
    required this.txtNombreUsuario,
    required this.txtApptUsuarioController,
    required this.txtApmtUsuarioController,
  });
  final TextEditingController txtNombreUsuario;
  final TextEditingController txtApptUsuarioController;
  final TextEditingController txtApmtUsuarioController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        WgFormTextField(
          prop: 'Nombre',
          errorMessage: "Falta completar este campo",
          txtController: txtNombreUsuario,
          inputType: TextInputType.text,
        ),
        WgFormTextField(
          prop: 'Apellido Paterno',
          errorMessage: "Ingrese su apellido paterno, es requerido.",
          txtController: txtApptUsuarioController,
          inputType: TextInputType.text,
        ),
        WgFormTextField(
          prop: 'Apellido Materno',
          errorMessage: "Ingrese su apellido materno, es requerido.",
          txtController: txtApmtUsuarioController,
          inputType: TextInputType.text,
        ),
      ],
    );
  }
}

class WgFormView2 extends StatelessWidget {
  const WgFormView2({
    super.key,
    required this.txtEdadUsuarioController,
    required this.txtTelefonoController,
    required this.$changeGenero,
  });
  final TextEditingController txtEdadUsuarioController;
  final TextEditingController txtTelefonoController;
  final void Function(String?) $changeGenero;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WgFormTextField(
          prop: 'Edad',
          errorMessage: "La edad es requerida",
          txtController: txtEdadUsuarioController,
          inputType: TextInputType.number,
        ),
        WgCustomDropdown1(
          $titulo: "Género",
          $placeholder: "Selecciona tu género",
          $nullErrorMessage: "Complete el campo",
          $items: lstGeneros.map((e) => e["genero"] as String).toList(),
          $onChanged: $changeGenero,
        ),
        WgFormTextField(
          prop: 'Telefono',
          errorMessage: "Necesita registrar su numero de telefono",
          txtController: txtTelefonoController,
          inputType: TextInputType.phone,
        ),
      ],
    );
  }
}

class WgFormView3 extends StatelessWidget {
  const WgFormView3({
    super.key,
    required this.txtCodigoPostalController,
    required this.$onChangeMunicipio,
    required this.$onChangeEstado,
    this.estado,
  });
  final TextEditingController txtCodigoPostalController;
  final void Function(Municipio)? $onChangeMunicipio;
  final void Function(Estado)? $onChangeEstado;
  final Estado? estado;

  static String _displayStringForOptionEstado(Estado est) => est.estado;
  static String _displayStringForOptionMunicipio(Municipio m) => m.municipio;
  @override
  Widget build(BuildContext context) {
    final Future<List<Estado>> futureEstados = getEstadosList();
    final Future<List<Municipio>> futureMunicipios = estado != null
        ? getMunicipiosFromIdEstado(estado!.idEstado)
        : getMunicipiosList();
    return Column(
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
          txtController: txtCodigoPostalController,
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
              onSelected: $onChangeEstado,
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
          future: futureMunicipios,
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
              onSelected: $onChangeMunicipio,
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
    );
  }
}

class WgFormView4 extends StatelessWidget {
  const WgFormView4({
    super.key,
    required this.txtCorreoUsuarioController,
    required this.txtPwdUsuarioController,
    required this.txtPwdUsuarioCheckController,
  });
  final TextEditingController txtCorreoUsuarioController;
  final TextEditingController txtPwdUsuarioController;
  final TextEditingController txtPwdUsuarioCheckController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WgFormTextField(
          prop: 'Email',
          txtController: txtCorreoUsuarioController,
          inputType: TextInputType.emailAddress,
          icono: const Icon(Icons.email),
        ),
        WgFormTextField(
          prop: 'Contraseña',
          txtController: txtPwdUsuarioController,
          inputType: TextInputType.visiblePassword,
          isPassword: true,
        ),
        WgFormTextField(
          prop: 'Repita Contraseña',
          txtController: txtPwdUsuarioCheckController,
          inputType: TextInputType.visiblePassword,
          isPassword: true,
        ),
      ],
    );
  }
}
