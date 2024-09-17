import 'dart:async';
import 'dart:math';

import 'package:block_game/peice.dart';
import 'package:block_game/pixel.dart';
import 'package:block_game/values.dart';
import 'package:flutter/material.dart';

List<List<Tetromino?>> gameBoard = List.generate(
  columnLenght,
  (i) => List.generate(
    rowLenght,
    (j) => null,
  ),
);

class Board extends StatefulWidget {
  const Board({super.key});

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  int currentScore = 0;
  Piece currentPeice = Piece(type: Tetromino.Z);

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    currentPeice.initialPeice();

    Duration frameRate = const Duration(milliseconds: 400);
    gameLoop(frameRate);
  }

  void gameLoop(Duration frameRate) {
    Timer.periodic(
      frameRate,
      (timer) {
        setState(
          () {
            clearLines();
            checkLanding();
            currentPeice.movePeice(Direction.dowm);
          },
        );
      },
    );
  }

  bool checkCollision(Direction direction) {
    for (int i = 0; i < currentPeice.position.length; i++) {
      int row = (currentPeice.position[i] / rowLenght).floor();
      int col = (currentPeice.position[i] % rowLenght);

      if (direction == Direction.dowm) {
        row++;
      } else if (direction == Direction.right) {
        col++;
      } else if (direction == Direction.left) {
        col--;
      }
      if (col < 0 || col >= rowLenght || row >= columnLenght) {
        return true;
      }

      if (row >= 0 && gameBoard[row][col] != null) {
        return true;
      }
    }

    return false;
  }

  void checkLanding() {
    if (checkCollision(Direction.dowm)) {
      for (int i = 0; i < currentPeice.position.length; i++) {
        int row = (currentPeice.position[i] / rowLenght).floor();
        int col = currentPeice.position[i] % rowLenght;
        if (row >= 0 && col >= 0) {
          gameBoard[row][col] = currentPeice.type;
        }
      }
      createNewPeice();
    }
  }

  void createNewPeice() {
    Random random = Random();

    Tetromino randomType =
        Tetromino.values[random.nextInt(Tetromino.values.length)];

    currentPeice = Piece(type: randomType);
    currentPeice.initialPeice();
  }

  void moveLeft() {
    if (!checkCollision(Direction.left)) {
      setState(() {
        currentPeice.movePeice(Direction.left);
      });
    }
  }

  void moveRight() {
    if (!checkCollision(Direction.right)) {
      setState(() {
        currentPeice.movePeice(Direction.right);
      });
    }
  }

  void rotate() {
    setState(() {
      currentPeice.rotatePeice();
    });
  }

  void clearLines() {
    for (int row = columnLenght - 1; row >= 0; row--) {
      bool rowIsFull = true;
      for (int col = 0; col < rowLenght; col++) {
        if (gameBoard[row][col] == null) {
          rowIsFull = false;
          break;
        }
      }
      if (rowIsFull) {
        for (int r = row; r > 0; r--) {
          gameBoard[r] = List.from(gameBoard[r - 1]);
        }
        gameBoard[0] = List.generate(row, (index) => null);

        currentScore = currentScore + 50;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: rowLenght * columnLenght,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: rowLenght),
              itemBuilder: (context, index) {
                int row = (index / rowLenght).floor();
                int column = index % rowLenght;
                if (currentPeice.position.contains(index)) {
                  return Pixel(
                    color: currentPeice.color,
                    child: index.toString(),
                  );
                } else if (gameBoard[row][column] != null) {
                  final Tetromino? tetrominoType = gameBoard[row][column];
                  return Pixel(
                    color: tetrominoColors[tetrominoType],
                    child: index.toString(),
                  );
                } else {
                  return Pixel(
                    color: Colors.grey.shade800,
                    child: index.toString(),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Score: $currentScore",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: moveLeft,
                  color: Colors.white,
                  iconSize: 40,
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                IconButton(
                  onPressed: rotate,
                  color: Colors.white,
                  iconSize: 40,
                  icon: const Icon(
                    Icons.rotate_right,
                  ),
                ),
                IconButton(
                  onPressed: moveRight,
                  color: Colors.white,
                  iconSize: 40,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
