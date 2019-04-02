int couleurRouge= 0, tailleDiametre; 
float distBB8Cible, rotation;

class BB8 {
  float x, y;
  float taille;
  color couleur;

  BB8(color couleur) {
    this.couleur = couleur;
  }

  void dessiner() {

    // le corps
    stroke(0);
    strokeWeight(1);
    fill(200);
    ellipseMode(CENTER);
    ellipse(x, y, width/10, width/10);

    //cercle imbriqué
    fill(couleur);
    ellipse(x, y, width/15, width/15);
    fill(200);
    ellipse(x, y, width/20, width/20);

    // l'antenne
    strokeWeight(2);
    line(x - 5, y - width/10, x - 5, y - width/12);
    line(x + 5, y - width/10, x + 5, y - width/12);

    //Annulation des changements
    stroke(0);
    strokeWeight(1);

    // la tête
    fill(200);
    arc(x, y - width/20, width/15, width/15, -PI, 0, CHORD);

    // la caméra
    fill(70);
    ellipse(x, y-width/15, width/80, width/80);
    fill(0);
    ellipse(x, y-width/15, width/90, width/90);

    //sintillement de la led
    couleurRouge = (couleurRouge +1) % 255 ;

    // la led
    fill(couleurRouge, 0, 0);
    ellipse(x+width/60, y-width/15, width/95, width/95);

    // anneaux à l'intérieur
    tailleDiametre = width/60;
    stroke(0);
    strokeWeight(2);

    //rotation des axes.
    rotation = (rotation + 0.1) % TWO_PI ;

    //axe horizontale
    line (x+tailleDiametre*cos(rotation+PI), y+tailleDiametre*sin(rotation+PI), x+tailleDiametre*cos(rotation), y+tailleDiametre*sin(rotation));

    //axe verticale
    line (x+tailleDiametre*cos(rotation-HALF_PI), y+tailleDiametre*sin(rotation-HALF_PI), x+tailleDiametre*cos(rotation+HALF_PI), y+tailleDiametre*sin(rotation+HALF_PI));
  }
}
