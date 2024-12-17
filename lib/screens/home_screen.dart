import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tenis_web/menu/config/tab_controller.dart';
import 'package:tenis_web/screens/partidos_finalizados_screen.dart';
import 'package:tenis_web/screens/partidos_pendientes_screen.dart';
import 'package:tenis_web/services/partidos_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  PartidosService partidosService = PartidosService();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Tabs.length,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('Partidos Tenis 2024/2025', style: TextStyle(color: Colors.white),),
          centerTitle: true,
          bottom: TabBar(tabs: Tabs),
          ),
        body: TabBarView(children: [
          PartidosPendientesScreen(partidosService: partidosService),
          PartidosFinalizadosScreen(partidosService: partidosService)
        ]),
      ),
    );
  }
}

