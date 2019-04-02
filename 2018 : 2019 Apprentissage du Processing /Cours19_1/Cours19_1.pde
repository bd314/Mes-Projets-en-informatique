Grille grille;
boolean tours = false;

void setup() {
  size(400, 400);
  grille = new Grille(3, 3);
}

void draw() {
  background(0);
  if (!grille.gagner()) {
    grille.dessiner();
  } else {
    background(0,255,0);
  }
}

void mousePressed() {

  grille.click(mouseX, mouseY);
}
