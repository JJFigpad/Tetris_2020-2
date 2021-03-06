//Variables del tablero
int[][] tablero = new int[col+2][fil+1];
int ct = 1;
int ct1 = 0;

//Funciones del tablero
void Tablero() { //Valores iniciales del tablero
  for (int i = 0; i <= col+1; i++) {
    for (int j = 0; j <= fil; j++) {
      tablero[i][j] = 0;
    }
  }
}

void displayT() { //Dibujar el tablero
  strokeWeight(3.5);
  stroke(152, 147, 119);
  pushMatrix();
  translate(121, 9);
  for (int i = 1; i <= col; i ++) {
    line(i*30, 0, i*30, fil*30);
  }
  for (int j = 0; j <= fil; j ++) {
    line(30, j*30, col*30, j*30);
  }
  for (int i = 1; i <= col; i ++) {
    for (int j = 0; j < fil; j ++) {
      if (tablero[i][j] == 0) {
        fill(50, 50, 50);
        rect(i*30, j*30, 30, 30);
      } else if (tablero[i][j] == 1) {
        fill(191, 98, 255);
        rect(i*30, j*30, 30, 30);
      } else if (tablero[i][j] == 2) {
        fill(255, 109, 0);
        rect(i*30, j*30, 30, 30);
      } else if (tablero[i][j] == 3) {
        fill(21, 79, 212);
        rect(i*30, j*30, 30, 30);
      } else if (tablero[i][j] == 4) {
        fill(244, 253, 0);
        rect(i*30, j*30, 30, 30);
      } else if (tablero[i][j] == 5) {
        fill(68, 120, 0);
        rect(i*30, j*30, 30, 30);
      } else if (tablero[i][j] == 6) {
        fill(196, 0, 5);
        rect(i*30, j*30, 30, 30);
      } else if (tablero[i][j] == 7) {
        fill(0, 204, 204);
        rect(i*30, j*30, 30, 30);
      }
    }
  }
  popMatrix();
  borrarFila();
}

void borrarFila() { //Borrar una fila cuando esta completa
  int borrar = 0;
  int tempi = 0;
  for (int j = 0; j < fil; j ++) {
    for (int i = 1; i <= col; i ++) {
      if (tablero[i][j] != 0) {
        borrar++;
      }
      if (borrar >= col) {
        tempi = j;
        borrar = 0;
        score += 100;
        ct++;
        ct1++;
        if (ct%6 == 0 && nivel < 12) {
          nivel++;
          ct -= 5;
        }
        break;
      }
    }
    borrar = 0;
  }
  for (int i = 1; i <= col; i ++) {
    for (int j = tempi; j >= 1; j --) {
      tablero[i][j] = tablero[i][j-1];
    }
  }
}

void cambioP() { //Representacion de cada pieza en el tablero
    if (rand == "T") {
      if (tRotation == 0) {
        tablero[temph+1][tempc] = 1;
        tablero[temph+1][tempc+1] = 1;
        tablero[temph][tempc] = 1;
        tablero[temph+2][tempc] = 1;
      } else if (tRotation == 1) {
        tablero[temph+1][tempc+1] = 1;
        tablero[temph+1][tempc] = 1;
        tablero[temph+1][tempc-1] = 1;
        tablero[temph+2][tempc] = 1;
      } else if (tRotation == 2) {
        tablero[temph+1][tempc] = 1;
        tablero[temph+1][tempc-1] = 1;
        tablero[temph][tempc] = 1;
        tablero[temph+2][tempc] = 1;
      } else if (tRotation == 3) {
        tablero[temph][tempc] = 1;
        tablero[temph+1][tempc+1] = 1;
        tablero[temph+1][tempc] = 1;
        tablero[temph+1][tempc-1] = 1;
      }
    } else if (rand == "L") {
      if (tRotation == 0) {
        tablero[temph+1][tempc-1] = 2;
        tablero[temph+2][tempc-1] = 2;
        tablero[temph+2][tempc] = 2;
        tablero[temph+2][tempc+1] = 2;
      } else if (tRotation == 1) {
        tablero[temph][tempc+1] = 2;
        tablero[temph+1][tempc+1] = 2;
        tablero[temph+2][tempc+1] = 2;
        tablero[temph+2][tempc] = 2;
      } else if (tRotation == 2) {
        tablero[temph+2][tempc+1] = 2;
        tablero[temph+1][tempc-1] = 2;
        tablero[temph+1][tempc+1] = 2;
        tablero[temph+1][tempc] = 2;
      } else if (tRotation == 3) {
        tablero[temph+1][tempc] = 2;
        tablero[temph][tempc+1] = 2;
        tablero[temph][tempc] = 2;
        tablero[temph+2][tempc] = 2;
      }
    } else if (rand == "J") {
      if (tRotation == 0) {
        tablero[temph+1][tempc+1] = 3;
        tablero[temph+2][tempc-1] = 3;
        tablero[temph+2][tempc] = 3;
        tablero[temph+2][tempc+1] = 3;
      } else if (tRotation == 1) {
        tablero[temph][tempc+1] = 3;
        tablero[temph+1][tempc+1] = 3;
        tablero[temph+2][tempc+1] = 3;
        tablero[temph][tempc] = 3;
      } else if (tRotation == 2) {
        tablero[temph+2][tempc-1] = 3;
        tablero[temph+1][tempc-1] = 3;
        tablero[temph+1][tempc+1] = 3;
        tablero[temph+1][tempc] = 3;
      } else if (tRotation == 3) {
        tablero[temph+1][tempc] = 3;
        tablero[temph+2][tempc+1] = 3;
        tablero[temph][tempc] = 3;
        tablero[temph+2][tempc] = 3;
      }
    } else if (rand == "O") {
      tablero[temph][tempc] = 4;
      tablero[temph+1][tempc] = 4;
      tablero[temph][tempc-1] = 4;
      tablero[temph+1][tempc-1] = 4;
    } else if (rand == "Z") {
      if (tRotation == 0 || tRotation == 2) {
        tablero[temph][tempc+1] = 5;
        tablero[temph+1][tempc+1] = 5;
        tablero[temph+1][tempc] = 5;
        tablero[temph+2][tempc] = 5;
      } else if (tRotation == 1 || tRotation == 3) {
        tablero[temph][tempc-1] = 5;
        tablero[temph][tempc] = 5;
        tablero[temph+1][tempc] = 5;
        tablero[temph+1][tempc+1] = 5;
      }
    } else if (rand == "S") {
      if (tRotation == 0 || tRotation == 2) {
        tablero[temph][tempc] = 6;
        tablero[temph+1][tempc] = 6;
        tablero[temph+1][tempc+1] = 6;
        tablero[temph+2][tempc+1] = 6;
      } else if (tRotation == 1 || tRotation == 3) {
        tablero[temph+1][tempc-1] = 6;
        tablero[temph+1][tempc] = 6;
        tablero[temph][tempc] = 6;
        tablero[temph][tempc+1] = 6;
      }
    } else if (rand == "I") {
      if (tRotation == 0 || tRotation == 2) {
        tablero[temph+3][tempc-1] = 7;
        tablero[temph+3][tempc] = 7;
        tablero[temph+3][tempc+1] = 7;
        tablero[temph+3][tempc+2] = 7;
      } else if (tRotation == 1 || tRotation == 3) {
        tablero[temph][tempc] = 7;
        tablero[temph+1][tempc] = 7;
        tablero[temph+2][tempc] = 7;
        tablero[temph+3][tempc] = 7;
      }
    }
}
