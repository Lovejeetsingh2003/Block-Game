import 'package:block_game/board.dart';
import 'package:block_game/values.dart';
import 'package:flutter/material.dart';

int rowLenght = 10;
int columnLenght = 15;

class Piece {
  Tetromino type;

  Piece({required this.type});

  List<int> position = [];

  Color get color {
    return tetrominoColors[type] ?? Colors.white;
  }

  void initialPeice() {
    switch (type) {
      case Tetromino.L:
        position = [-26, -16, -6, -5];
      case Tetromino.J:
        position = [-25, -15, -5, -6];
      case Tetromino.I:
        position = [-4, -5, -6, -7];
      case Tetromino.O:
        position = [-5, -6, -15, -16];
      case Tetromino.S:
        position = [-5, -6, -15, -14];
      case Tetromino.Z:
        position = [-5, -6, -16, -17];
      case Tetromino.T:
        position = [-26, -16, -6, -15];
        break;
      default:
    }
  }

  void movePeice(Direction direction) {
    switch (direction) {
      case Direction.dowm:
        for (int i = 0; i < position.length; i++) {
          position[i] += rowLenght;
        }
      case Direction.left:
        for (int i = 0; i < position.length; i++) {
          position[i] -= 1;
        }
      case Direction.right:
        for (int i = 0; i < position.length; i++) {
          position[i] += 1;
        }
        break;
      default:
    }
  }

  int rotatingState = 1;
  void rotatePeice() {
    List<int> newPosition = [];
    switch (type) {
      case Tetromino.L:
        switch (rotatingState) {
          case 0:
            newPosition = [
              position[1] - rowLenght,
              position[1],
              position[1] + rowLenght,
              position[1] + rowLenght + 1,
            ];

            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }

            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + rowLenght - 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + rowLenght,
              position[1],
              position[1] - rowLenght,
              position[1] - rowLenght - 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] - rowLenght + 1,
              position[1],
              position[1] + 1,
              position[1] - 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          default:
        }
        break;
      case Tetromino.J:
        switch (rotatingState) {
          case 0:
            newPosition = [
              position[1] - rowLenght,
              position[1],
              position[1] + rowLenght,
              position[1] + rowLenght - 1,
            ];

            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }

            break;
          case 1:
            newPosition = [
              position[1] - rowLenght - 1,
              position[1],
              position[1] - 1,
              position[1] + 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + rowLenght,
              position[1],
              position[1] - rowLenght,
              position[1] - rowLenght + 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] + 1,
              position[1],
              position[1] - 1,
              position[1] + rowLenght + 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;

          default:
        }
        break;
      case Tetromino.I:
        switch (rotatingState) {
          case 0:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + 2,
            ];

            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }

            break;
          case 1:
            newPosition = [
              position[1] - rowLenght,
              position[1],
              position[1] + rowLenght,
              position[1] + 2 * rowLenght,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] + 1,
              position[1],
              position[1] - 1,
              position[1] - 2,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] + rowLenght,
              position[1],
              position[1] - rowLenght,
              position[1] - 2 * rowLenght,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
        }
        break;
      case Tetromino.S:
        switch (rotatingState) {
          case 0:
            newPosition = [
              position[1],
              position[1] + 1,
              position[1] + rowLenght - 1,
              position[1] + rowLenght,
            ];

            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }

            break;
          case 1:
            newPosition = [
              position[0] - rowLenght,
              position[0],
              position[0] + 1,
              position[0] + rowLenght + 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1],
              position[1] + 1,
              position[1] + rowLenght - 1,
              position[1] + rowLenght,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[0] - rowLenght,
              position[0],
              position[0] + 1,
              position[0] + rowLenght + 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
        }
        break;
      case Tetromino.Z:
        switch (rotatingState) {
          case 0:
            newPosition = [
              position[0] + rowLenght - 2,
              position[1],
              position[2] + rowLenght - 1,
              position[3] + 1,
            ];

            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }

            break;
          case 1:
            newPosition = [
              position[0],
              position[1] - rowLenght + 2,
              position[2] - rowLenght + 1,
              position[3] - 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[0] + rowLenght - 2,
              position[1],
              position[2] + rowLenght - 1,
              position[3] + 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[0] - rowLenght + 2,
              position[1],
              position[2] - rowLenght + 1,
              position[3] - 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
        }
        break;
      case Tetromino.T:
        switch (rotatingState) {
          case 0:
            newPosition = [
              position[1] - rowLenght,
              position[1],
              position[1] + 1,
              position[1] + rowLenght,
            ];

            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }

            break;
          case 1:
            newPosition = [
              position[1] - 1,
              position[1],
              position[1] + 1,
              position[1] + rowLenght,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 2:
            newPosition = [
              position[1] - rowLenght,
              position[1] - 1,
              position[1],
              position[1] + rowLenght,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
          case 3:
            newPosition = [
              position[1] - rowLenght,
              position[1] - 1,
              position[1],
              position[1] + 1,
            ];
            if (peicePositionVlaid(newPosition)) {
              position = newPosition;
              rotatingState = (rotatingState + 1) % 4;
            }
            break;
        }
        break;

      case Tetromino.O:
        break;
      default:
    }
  }

  bool positionValid(int position) {
    int row = (position / rowLenght).floor();
    int col = position % rowLenght;

    if (row < 0 || col < 0 || gameBoard[row][col] != null) {
      return false;
    } else {
      return true;
    }
  }

  bool peicePositionVlaid(List<int> peicePosition) {
    bool firstColumnOccupied = false;
    bool lastColumnOccupied = false;
    for (int pos in peicePosition) {
      if (!positionValid(pos)) {
        return false;
      }
      int col = pos % rowLenght;

      if (col == 0) {
        firstColumnOccupied = true;
      }
      if (col == rowLenght - 1) {
        lastColumnOccupied = true;
      }
    }
    return !(firstColumnOccupied && lastColumnOccupied);
  }
}
