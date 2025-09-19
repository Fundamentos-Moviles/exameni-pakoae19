import 'package:flutter/material.dart';

///Colores
const gris = Colors.grey;
const verde = Colors.green;
const rojo = Colors.red;

// Colores iniciales del tablero
List<Color> colores = [gris, gris, gris, gris, gris, gris,
                      gris, gris, gris, gris, gris, gris,
                      gris, gris, gris, gris, gris, gris,
                      gris, gris, gris, gris, gris, gris,
                      gris, gris, gris, gris, gris, gris,
                      gris, gris, gris, gris, gris, gris,];

// Representación gráfica del tablero
bool O = false; // O representa casilla segura
bool X = true;  // X representa una mina

List<bool> tablero = [O,O,O,O,O,O,  // Fila 0
                      O,O,O,O,O,X,  // Fila 1
                      O,X,O,O,O,O,  // Fila 2
                      O,O,O,O,O,O,  // Fila 3
                      O,O,O,O,O,O,  // Fila 4
                      O,O,O,O,O,O]; // Fila 5