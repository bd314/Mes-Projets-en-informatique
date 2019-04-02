class Hitbox {
  // attributs
  float x, y;
  color couleur;
  float taille;

  // constructeurs
  Hitbox() {
    x = 0;
    y = height / 2;
    couleur = color(255, 0, 0);
    taille = 50;
  }

  Hitbox(float x, float y, color couleur, float taille) {
    this.x =x;
    this.y = y;
    this.couleur = couleur;
    this.taille = taille;
  }

  // méthodes
  void creer() {
    rectMode(CORNERS);
    fill(couleur);

    //rect(x, y, x+taille/2, y+taille);  Afficher la hitbox
    robot.dessiner();
    robot.x = x+width/20;
    robot.y = y+width/6.5;
  }

  void bouger() {  //fonction pour déplacer le personnage et gérer sa hitbox.
    if (keyPressed) {
      int distance=width/10;
      if ( keyCode == UP && Monde.nextBlock(Monde.gridNav(Environnement.x, Environnement.y), -20 )) {
        y-=distance;
        delay(180);
      } else if (keyCode == DOWN && Monde.nextBlock(Monde.gridNav(Environnement.x, Environnement.y), 10)) {
        y+=distance;
        delay(180);
      } else if (keyCode == RIGHT && Monde.nextBlock(Monde.gridNav(Environnement.x, Environnement.y), 1) && Monde.nextBlock(Monde.gridNav(Environnement.x, Environnement.y), -9) ) {
        x+=distance;
        delay(180);
      } else if (keyCode == LEFT && Monde.nextBlock(Monde.gridNav(Environnement.x, Environnement.y), -1) && Monde.nextBlock(Monde.gridNav(Environnement.x, Environnement.y), -11)) {
        x-=distance;
        delay(180);
      }
    }
  }
}
