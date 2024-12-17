// To parse this JSON data, do
//
//     final partidosFinalizadosResponse = partidosFinalizadosResponseFromJson(jsonString);

import 'dart:convert';

import 'package:tenis_web/models/jugador_model.dart';
import 'package:tenis_web/models/partidos_pendientes_response_model.dart';

PartidosFinalizadosResponse partidosFinalizadosResponseFromJson(String str) => PartidosFinalizadosResponse.fromJson(json.decode(str));

String partidosFinalizadosResponseToJson(PartidosFinalizadosResponse data) => json.encode(data.toJson());

class PartidosFinalizadosResponse {
    String status;
    Map<String, PartidoFinalizado> data;

    PartidosFinalizadosResponse({
        required this.status,
        required this.data,
    });

    factory PartidosFinalizadosResponse.fromJson(Map<String, dynamic> json) => PartidosFinalizadosResponse(
        status: json["status"],
        data: Map.from(json["data"]).map((k, v) => MapEntry<String, PartidoFinalizado>(k, PartidoFinalizado.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class PartidoFinalizado {
    Jugador jugador1;
    Jugador jugador2;
    String puntuacion;

    PartidoFinalizado({
        required this.jugador1,
        required this.jugador2,
        required this.puntuacion,
    });

    factory PartidoFinalizado.fromJson(Map<String, dynamic> json) => PartidoFinalizado(
        jugador1: Jugador.fromJson(json["jugador1"]),
        jugador2: Jugador.fromJson(json["jugador2"]),
        puntuacion: json["puntuacion"],
    );

    Map<String, dynamic> toJson() => {
        "jugador1": jugador1.toJson(),
        "jugador2": jugador2.toJson(),
        "puntuacion": puntuacion,
    };
}
