
class Grille {
  Cellule[][] cellules;
  int lignes, colonnes;

  Grille(int lignes, int colonnes) {
    this.lignes = lignes;
    this.colonnes = colonnes;
    cellules = new Cellule[lignes][colonnes];

    float w = float(width) / colonnes;
    float h = float(height) / lignes;
    for (int i = 0; i < lignes; i++) {
      for (int j = 0; j < colonnes; j++) {
        cellules[i][j] = new Cellule(w * j, h * i, w, h);
      }
    }
  }

  void dessiner() {
    for (int i = 0; i < lignes; i++) {
      for (int j = 0; j < colonnes; j++) {
        cellules[i][j].dessiner();
      }
    }
  }

  boolean gagner() {
    boolean result = false;
    for ( int i=0; i<3; i++) {
      if (cellules[i][0].etat == 1   && cellules[i][1].etat == 1  && cellules[i][2].etat == 1) {
        result = true;
      }else if(cellules[i][0].etat == 2   && cellules[i][1].etat == 2  && cellules[i][2].etat == 2) {
        result = true;
      }else if(cellules[i][0].etat == 2   && cellules[i][1].etat == 2  && cellules[i][2].etat == 2) {
        result = true;
      }else if(cellules[0][0].etat == 2   && cellules[1][1].etat == 2  && cellules[2][2].etat == 2) {
        result = true;
      }else if(cellules[0][0].etat == 1   && cellules[1][1].etat == 1  && cellules[2][2].etat == 1) {
        result = true;
      }else if(cellules[2][0].etat == 2   && cellules[1][1].etat == 2  && cellules[0][2].etat == 2) {
        result = true;
      }else if(cellules[2][0].etat == 1   && cellules[1][1].etat == 1  && cellules[0][2].etat == 1) {
        result = true;
      }else if (cellules[0][i].etat == 1   && cellules[1][i].etat == 1  && cellules[2][i].etat == 1) {
        result = true;
      }else if(cellules[0][i].etat == 2   && cellules[1][i].etat == 2  && cellules[2][i].etat == 2) {
        result = true;
      }
    }

    return result;
  }


  void click(int mx, int my) {
    for (int i = 0; i < lignes; i++) {
      for (int j = 0; j < colonnes; j++) {
        cellules[i][j].click(mx, my);
      }
    }
  }
}
