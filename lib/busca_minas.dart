import 'package:flutter/material.dart';
import 'package:examen1_fdm/constants.dart' as cons;

class BuscaMinas extends StatefulWidget {
  const BuscaMinas({super.key});

  @override
  State<BuscaMinas> createState() => _BuscaMinasState();
}

class _BuscaMinasState extends State<BuscaMinas> {
  @override
  Widget build(BuildContext context) {
    ///Obtiene le valor/tamaño de la pantalla actual
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // Título (BuscaMinas)
          Container(
            height: size.height * 0.075,
            alignment: Alignment.centerLeft,
            child: const Text('  BuscaMinas'),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: size.width * 0.999,
                height: size.height * 1,
                child: Column(
                  children: [
                    for (int i = 0; i + 6 <= cons.tablero.length; i += 6)
                      Expanded(
                        child: Row(
                          children: [
                            for (int j = 0; j < 6; j++)
                              Expanded(
                                child: InkWell(
                                  //Da acción de botón a cualquier widget
                                  child: Container(
                                      decoration: BoxDecoration(
                                        color: cons.colores[i + j],
                                        border: Border.all(width: 2, color: Colors.white),
                                        borderRadius: BorderRadius.circular(7)
                                      )
                                  ),
                                  onTap: () {
                                    setState(() {
                                      // Si la casilla es segura la hace verde, si no, termina el juego
                                      (!cons.tablero[i + j]) ? cons.colores[i + j] = cons.verde : gameOver();
                                    });
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                  ]
                )
              )
            )
          ),

          // Botón para reiniciar
          Container(
            height: size.height * 0.125,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      reiniciarTablero();
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlue[100],
                  ),
                  child: const Text(
                      'Reiniciar',
                      style: TextStyle(color: Colors.black)
                  ),
                ),
              ],
            ),
          ),
          // Nombre y clave
          Container(
            alignment: Alignment.bottomLeft,
            child: const Text('  Franscico Javier Andrade Espinosa 324777'),
          ),
        ],
      ),
    );
  }
}

void gameOver() {
  // Hace todas las casillas verdes a excepción de la(s) mina(s)
  for (int i = 0; i <= cons.tablero.length - 1; i++)
    cons.tablero[i] ? cons.colores[i] = cons.rojo : cons.colores[i] = cons.verde;
}

void reiniciarTablero() {
  // Cambia la(s) mina(s) a una posición aleatoria
  cons.tablero.shuffle();

  // Hace todas las casillas grises
  for (int i = 0; i <= cons.tablero.length - 1; i++)
    cons.colores[i] = cons.gris;
}
