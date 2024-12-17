import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tenis_web/services/partidos_service.dart';

class PartidosFinalizadosScreen extends StatelessWidget {
  const PartidosFinalizadosScreen({
    super.key,
    required this.partidosService,
  });

  final PartidosService partidosService;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: partidosService.getPartidosFinalizados(),
      builder: (context, snapshot) {
      String textoMarquee = '';
      if (snapshot.hasData){
      for (var element in snapshot.data!) {
        textoMarquee += '| ${element.jugador1.nombre} ${element.puntuacion} ${element.jugador2.nombre} ';
      }}
      return !snapshot.hasData
            ? CircularProgressIndicator()
            : snapshot.data!.isEmpty
                ? Center(
                    child: Text(
                        'No se ha jugado ningún partido. La temporada empieza en breves!!!'),
                  )
                : Center(
                    child: Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 25,
                          child: Marquee(
                            text: textoMarquee.isEmpty ? 'No hay partidos' : textoMarquee,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            velocity: 75.0,
                            pauseAfterRound: Duration(seconds: 1),
                            numberOfRounds: 5,
                            accelerationDuration: Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration: Duration(milliseconds: 500),
                            decelerationCurve: Curves.easeOut,
                          ),
                        ),
                        Text(
                          'Partidos Finalizados',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            snapshot.data![index].jugador1.img),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: 50,
                                          child: Flexible(
                                              child: Text(
                                            snapshot
                                                .data![index].jugador1.nombre,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                          ))),
                                    ],
                                  ),
                                  Text('${snapshot.data![index].puntuacion}',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                          backgroundImage: NetworkImage(snapshot
                                              .data![index].jugador2.img)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                          width: 50,
                                          child: Flexible(
                                              child: Text(
                                            snapshot
                                                .data![index].jugador2.nombre,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            softWrap: false,
                                          ))),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
      },
    );
  }
}
