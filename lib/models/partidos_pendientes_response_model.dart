// To parse this JSON data, do
//
//     final partidosResponse = partidosResponseFromJson(jsonString);

import 'dart:convert';

import 'package:tenis_web/models/jugador_model.dart';

PartidosResponse partidosResponseFromJson(String str) => PartidosResponse.fromJson(json.decode(str));

String partidosResponseToJson(PartidosResponse data) => json.encode(data.toJson());

class PartidosResponse {
    String status;
    Map<String, PartidoPendiente> data;

    PartidosResponse({
        required this.status,
        required this.data,
    });

    factory PartidosResponse.fromJson(Map<String, dynamic> json) => PartidosResponse(
        status: json["status"],
        data: Map.from(json["data"]).map((k, v) => MapEntry<String, PartidoPendiente>(k, PartidoPendiente.fromJson(v))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "data": Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
    };
}

class PartidoPendiente {
    Jugador jugador1;
    Jugador jugador2;

    PartidoPendiente({
        required this.jugador1,
        required this.jugador2,
    });

    factory PartidoPendiente.fromJson(Map<String, dynamic> json) => PartidoPendiente(
        jugador1: Jugador.fromJson(json["jugador1"]),
        jugador2: Jugador.fromJson(json["jugador2"]),
    );

    Map<String, dynamic> toJson() => {
        "jugador1": jugador1.toJson(),
        "jugador2": jugador2.toJson(),
    };
}
