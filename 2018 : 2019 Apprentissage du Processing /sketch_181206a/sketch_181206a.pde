int y = 0; // pas besoin de boucle for, mais une variable compteur globale.

void setup() {
  size(200, 200);
  background(255);
  // On ralentit afin de voir les lignes se dessiner progressivement.
  
}

void draw() {
  // Dessine une ligne.
  y += 10;
  dessineLigne(y, width);
  dessineOeil(width/4, height/2, width/6, 0 );
  dessineOeil(width-(width/4), height/2, width/6, 0 );
}

void dessineLigne(int y, int tailleCarre) {
  stroke(0);
  line(0, y, tailleCarre, y);
  
}

void dessineGrille(int tailleCarre) {
  
}

void dessineOeil(float x, float y, float taille, color couleur) {
  stroke(0);
  fill(255);
  ellipse(x, y, taille, taille);
  float d = taille / 4 / dist(x, y, mouseX, mouseY);
  noStroke();
  fill(couleur);
  ellipse(x + (mouseX - x) * d, y + (mouseY - y ) * d, taille / 2, taille / 2);
}
