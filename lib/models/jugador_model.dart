
class Jugador {
    String img;
    String nombre;

    Jugador({
        required this.img,
        required this.nombre,
    });

    factory Jugador.fromJson(Map<String, dynamic> json) => Jugador(
        img: json["img"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "img": img,
        "nombre": nombre,
    };
}
