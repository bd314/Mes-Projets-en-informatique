class Tools {


  void destroy() {  //Vérfie si le joueur est proche du bloque à maximum 1 block, sinon il ne se passe rien
    if (mousePressed) {
      if (  Monde.gridNav(Environnement.x, Environnement.y) -11 ==  Monde.curseur ||
        Monde.gridNav(Environnement.x, Environnement.y) - 10 ==  Monde.curseur ||
        Monde.gridNav(Environnement.x, Environnement.y) - 9 ==  Monde.curseur ||
        Monde.gridNav(Environnement.x, Environnement.y) -1 ==  Monde.curseur ||
        Monde.gridNav(Environnement.x, Environnement.y) +1 ==  Monde.curseur||
        Monde.gridNav(Environnement.x, Environnement.y) +9 ==  Monde.curseur||
        Monde.gridNav(Environnement.x, Environnement.y) +11 ==  Monde.curseur||
        Monde.gridNav(Environnement.x, Environnement.y) +19 ==  Monde.curseur||
        Monde.gridNav(Environnement.x, Environnement.y) +20 ==  Monde.curseur||
        Monde.gridNav(Environnement.x, Environnement.y) +21 ==  Monde.curseur) {

        //Determine les comportements si la souris clique sur la case.
        if (Monde.blocks[Monde.curseur-10] == 3) {
          Monde.blocks[Monde.curseur-10] = 0;
        } else if (Monde.blocks[Monde.curseur-10] == 5) {
          Monde.blocks[Monde.curseur-10] = 6;
          delay(180);
        } else if (Monde.blocks[Monde.curseur-10] == 6) {
          Monde.blocks[Monde.curseur-10] = 0;
          Monde.blocks[79] = 0;
          Monde.blocks[89] = 0;
        }
      }
    }
  }
}
