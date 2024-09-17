import 'dart:ui';

import 'package:flutter/material.dart';

enum Direction {
  left,
  right,
  dowm,
}

enum Tetromino {
  L,
  J,
  I,
  O,
  S,
  Z,
  T,

  /*
  O
  O
  O O 

    O
    O
  0 O

  O
  O
  O
  O

  O O
  O O

    O O
  O O

  O O
    O O

  O O O
    O
    */
}

const Map<Tetromino, Color> tetrominoColors = {
  Tetromino.L: Colors.orange,
  Tetromino.J: Colors.yellow,
  Tetromino.I: Colors.pink,
  Tetromino.O: Colors.redAccent,
  Tetromino.S: Colors.purple,
  Tetromino.Z: Colors.blue,
  Tetromino.T: Colors.cyanAccent,
};
