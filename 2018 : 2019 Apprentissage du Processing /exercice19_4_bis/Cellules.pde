// types de cellule
final int VIDE = 0;
final int OBSTACLE = 1;
final int TRESOR = 2;
final int VISITE = 3;

class Cellule {
  float x, y; // position du centre
  float w, h; // taille
  int type;
  boolean visiter= false;

  Cellule(float x, float y, float w, float h, int type) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.type = type;
  }

  void dessiner() {
    if (type == VIDE) {
      fill(26, 26, 26);
    } else if (type == OBSTACLE) {
      fill(77, 77, 77);
    } else if  (type == VISITE) {
      fill (231, 133, 24);
    } else {
      fill(255, 20, 20);
    }

    noStroke();
    rectMode(CENTER);
    rect(x, y, w, h);
  }
}

//Duvieu Baptiste
