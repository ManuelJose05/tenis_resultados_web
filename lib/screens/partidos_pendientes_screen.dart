import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:tenis_web/services/partidos_service.dart';

class PartidosPendientesScreen extends StatelessWidget {
  const PartidosPendientesScreen({
    super.key,
    required this.partidosService,
  });

  final PartidosService partidosService;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: 
    partidosService.getPartidosPendientes(), builder: (context, snapshot) {
      String textoMarquee = '';
      if (snapshot.hasData){
      for (var element in snapshot.data!) {
        textoMarquee += '| 16:30 - ${element.jugador1.nombre} vs ${element.jugador2.nombre} ';
      }
      }
      return !snapshot.hasData 
      ?
      CircularProgressIndicator()
      :
      snapshot.data!.isEmpty ?
      Center(
        child: Text('No hay partidos pendientes. Pasate al basket'),
      )
      :
      Center(
        child: Column(
          children: [
            Container(
                      width: MediaQuery.of(context).size.width,
                      height: 25,
                      child: 
                      Marquee(
                      text: textoMarquee.isEmpty ? 'La temporada comenzará en breve.': textoMarquee,
                        style: TextStyle(fontWeight: FontWeight.bold),
                        scrollAxis: Axis.horizontal,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        velocity: 50.0,
                        pauseAfterRound: Duration(seconds: 1),
                        numberOfRounds: 5,
              
                        accelerationDuration: Duration(seconds: 1),
                        accelerationCurve: Curves.linear,
                        decelerationDuration: Duration(milliseconds: 500),
                        decelerationCurve: Curves.easeOut,
                      )),
            Text('Partidos Pendientes', style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 400,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    titleAlignment: ListTileTitleAlignment.titleHeight,
                    leading: TextButton.icon(onPressed: null, icon: Icon(Icons.date_range_outlined,color: Colors.black,size: 25,),label: Text('12/12/2024 16:30',style: TextStyle(color: Colors.black,fontSize: 17),)),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage(snapshot.data![index].jugador1.img),
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: 100,
                                child: Flexible(
                                  child: Text(
                                    snapshot.data![index].jugador1.nombre,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    ))),
                            ],
                          ),
                        ),
                        Container(
                          width: 40,
                          child: Text('VS')),
                        Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundImage:  NetworkImage(snapshot.data![index].jugador2.img)
                              ),
                              SizedBox(width: 10,),
                              Container(
                                width: 100,
                                child: Flexible(
                                  child: Text(
                                    snapshot.data![index].jugador2.nombre,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    softWrap: false,
                                    ))),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                ),
            ),
          ],
        ),
      );
    },);
  }
}