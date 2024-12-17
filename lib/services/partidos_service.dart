import 'dart:convert';

import 'package:http/http.dart';
import 'package:tenis_web/models/partidos_finalizados_response_model.dart';
import 'package:tenis_web/models/partidos_pendientes_response_model.dart';

class PartidosService {
  final String url = 'https://backendtenisappnodejs-production.up.railway.app/api/v1/partidos';

  Future<List<PartidoPendiente>> getPartidosPendientes() async {
    List<PartidoPendiente> partidos = [];
    Uri uri = Uri.parse('$url/pendientes');
    Response response = await get(uri);

    final partidosPendintes = partidosResponseFromJson(response.body);

    partidosPendintes.data.forEach((key, value) {
      PartidoPendiente temp =
          PartidoPendiente(jugador1: value.jugador1, jugador2: value.jugador2);
      partidos.add(temp);
    });

    return partidos;
  }
  Future<List<PartidoFinalizado>> getPartidosFinalizados() async {
    List<PartidoFinalizado> partidos = [];
    Uri uri = Uri.parse('$url/finalizados');
    Response response = await get(uri);

    final partidosFinalizados = partidosFinalizadosResponseFromJson(response.body);
    partidosFinalizados.data.forEach((key,value) {
      PartidoFinalizado temp = PartidoFinalizado(jugador1: value.jugador1, jugador2: value.jugador2, puntuacion: value.puntuacion);
      partidos.add(temp);
    });
    return partidos;
  }
}
