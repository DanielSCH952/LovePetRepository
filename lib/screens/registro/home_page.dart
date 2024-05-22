import 'dart:io';

import 'package:flutter/material.dart';

import 'package:lovepet/extension/sized_box_extension.dart';
import 'package:lovepet/models/estado.dart';
import 'package:lovepet/models/municipio.dart';
import 'package:lovepet/screens/registro/form_reg_2.dart';
import 'package:lovepet/screens/registro/form_reg_3.dart';
import 'package:lovepet/screens/registro/form_reg_4.dart';
import 'package:lovepet/screens/registro/form_reg_5.dart';
import 'package:lovepet/screens/registro/wg_buttons.dart';
import 'package:lovepet/services/router.dart';
import 'package:lovepet/services/services.dart';
import 'package:lovepet/widgets/personal_widgets/card_image.dart';

import 'package:lovepet/widgets/personal_widgets/page_indicator_widget.dart';
import 'form_reg_1.dart';

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

  List<Widget> _wgListViews = [];

  int $currentIndexWidget = 0;

  //Datos usuarario
  final $txtNombreUsuario = TextEditingController();
  final $txtApptUsuarioController = TextEditingController();
  final $txtApmtUsuarioController = TextEditingController();
  final $txtEdadUsuarioController = TextEditingController();
  final $txtTelefonoUsuarioController = TextEditingController();
  final $txtCorreoUsuarioController = TextEditingController();
  final $txtPwdUsuarioController = TextEditingController();
  final $txtPwdUsuarioCheckController = TextEditingController();
  final $txtCodigoPostalController = TextEditingController();

  String? $generoUsuario;
  Estado? $estadoUsuario;
  Municipio? $municipio;
  File? imagenUsuario;
  bool show = false;
  bool showPassword = false;
  bool personalDataValidated = false;

  void $selectGenero(String? g) {
    setState(() {
      $generoUsuario = g;
    });
  }

  void $selectEstado(String? g) {
    if (g == null) return;
    setState(() {
      $estadoUsuario?.estado = g;
    });
  }

  void $selectMunicio(String? g) {
    if (g == null) return;
    setState(() {
      $municipio?.municipio = g;
    });
  }

  @override
  void initState() {
    super.initState();
    _wgListViews = [
      WgFormPage1(
        txtNombreUsuario: $txtNombreUsuario,
        txtApmtUsuarioController: $txtApmtUsuarioController,
        txtApptUsuarioController: $txtApmtUsuarioController,
      ),
      WgFormView2(
        txtEdadUsuarioController: $txtEdadUsuarioController,
        txtTelefonoController: $txtTelefonoUsuarioController,
        $changeGenero: $selectGenero,
      ),
      WgFormView3(
        txtEdadUsuarioController: $txtEdadUsuarioController,
        txtCodigoPostalController: $txtCodigoPostalController,
        estado: $estadoUsuario,
        $onChangeMunicipio: (p0) {},
        $onChangeEstado: (p0) {},
      ),
      WgFormView4(
        txtCorreoUsuarioController: $txtCorreoUsuarioController,
        txtPwdUsuarioCheckController: $txtPwdUsuarioCheckController,
        txtPwdUsuarioController: $txtPwdUsuarioController,
      ),
      WgFormView5(
        imagen: imagenUsuario,
        $handlePickImageCamara: _handlePickerImageCamaraEvent,
        $handlePickImageGalery: _handlePickerImageGaleryEvent,
      )
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

  void _handlePickerImageCamaraEvent() async {
    File? img = await seleccionarImagenCamara();
    if (img == null) return;
    setState(() {
      imagenUsuario = File(img.path);
    _updateContextWg();
    });
  }

  void _handlePickerImageGaleryEvent() async {
    File? img = await seleccionarImagenGaleria();
    if (img == null) return;
    setState(() {
      imagenUsuario = File(img.path);
      _updateContextWg();
    });
  }

  void _updateContextWg() {
    setState(() {
      _wgListViews = [WgCardImage(image: imagenUsuario!)];
    });
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
    if ($currentIndexWidget > _wgListViews.length) return;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 285,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Información personal',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            5.kH,
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
              tabController: _tabController,
              currentPageIndex: $currentIndexWidget,
            )
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: _handlePageViewChanged,
        controller: _pageViewController,
        padEnds: false,
        children: _wgListViews,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: WgButtonGroup(
        $currentIndx: $currentIndexWidget,
        $textLeft: $currentIndexWidget == 0 ? "Salir" : "Cancelar",
        $textRigth: $currentIndexWidget < _wgListViews.length
            ? "Continuar"
            : "Finalizar",
        $handleLefButton: () {
          if ($currentIndexWidget == 0) {
            Navigator.of(context).pushAndRemoveUntil(
              _router.createRoute(
                "/",
              ),
              (route) => false,
            );
            return;
          } else {
            _updateCurrentPageIndex($currentIndexWidget - 1);
          }
        },
        $handleRigthButton: () {
          if ($currentIndexWidget < _wgListViews.length) {
            _updateCurrentPageIndex($currentIndexWidget + 1);
          }
          return;
        },
      ),
    );
  }
}
