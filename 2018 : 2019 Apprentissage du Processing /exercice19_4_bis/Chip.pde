int couleurRouge= 0, uDiametre; 
float distBB8Cible, rotation;

class Chip {
  float x, y;
  float vitesse;
  float largeur;
  color couleur;
  Monde monde;
  int iDest, jDest;



  int[]deplacementI= {0}, deplacementJ= {0};
  int nbMouv;


  Chip(Monde monde, float vitesse, float largeur, color couleur) {
    this.monde = monde;
    iDest = 0;
    jDest = 0;
    x = monde.xColonne(jDest);
    y = monde.yLigne(iDest);
    this.vitesse = vitesse;
    this.largeur = largeur;
    this.couleur = couleur;
    nbMouv=0;
  }

  void dessiner() {
    //unité de taille.
    float u = width/2.2;
    
    // le corps
    stroke(0);
    strokeWeight(1);
    fill(200);
    ellipseMode(CENTER);
    ellipse(x, y, u/10, u/10);

    //cercle imbriqué
    fill(231, 133, 24);
    ellipse(x, y, u/15, u/15);
    fill(200);
    ellipse(x, y, u/20, u/20);

    // l'antenne
    strokeWeight(2);
    line(x - 5, y - u/10, x - 5, y - u/12);
    line(x + 5, y - u/10, x + 5, y - u/12);

    //Annulation des changements
    stroke(0);
    strokeWeight(1);

    // la tête
    fill(200);
    arc(x, y - u/20, u/15, u/15, -PI, 0, CHORD);

    // la caméra
    fill(70);
    ellipse(x, y-u/15, u/80, u/80);
    fill(0);
    ellipse(x, y-u/15, u/90, u/90);

    //sintillement de la led
    couleurRouge = (couleurRouge +1) % 255 ;

    // la led
    fill(couleurRouge, 0, 0);
    ellipse(x+u/60, y-u/15, u/95, u/95);

    // anneaux à l'intérieur
    uDiametre = int(u)/60;
    stroke(0);
    strokeWeight(2);

    //rotation des axes.
    rotation = (rotation + 0.1) % TWO_PI ;

    //axe horizontale
    line (x+uDiametre*cos(rotation+PI), y+uDiametre*sin(rotation+PI), x+uDiametre*cos(rotation), y+uDiametre*sin(rotation));

    //axe verticale
    line (x+uDiametre*cos(rotation-HALF_PI), y+uDiametre*sin(rotation-HALF_PI), x+uDiametre*cos(rotation+HALF_PI), y+uDiametre*sin(rotation+HALF_PI));
  }

  void avancerVers(float cibleX, float cibleY) {
    float d = dist(x, y, cibleX, cibleY);
    if (d >= vitesse) {
      x += vitesse * (cibleX - x) / d;
      y += vitesse * (cibleY - y) / d;
    }
  }

  boolean estArrive() {
    float d = dist(x, y, monde.xColonne(jDest), monde.yLigne(iDest));
    return d < vitesse;
  }

  boolean tresorTrouve() {
    return estArrive() && monde.contientTresor(iDest, jDest);
  }

  void choisirDestination() {
    int[] di = { 1, 0, -1, 0};
    int[] dj = { 0, 1, 0, -1};
    int[] choix = new int[4];
    int nbChoix = 0;

    //Stocke les mouvements de iDest, dans un tableau qui s'agrandis au fur et à mesure.
    int[] cnbMouvlacementI = append(deplacementI, iDest); 
    deplacementI =cnbMouvlacementI; 
    deplacementI[nbMouv]=iDest;
    //Stocke les mouvements de jDest, dans un tableau qui s'agrandis au fur et à mesure.
    int[] cnbMouvlacementJ = append(deplacementJ, jDest); 
    deplacementJ = cnbMouvlacementJ;     
    deplacementJ[nbMouv]=jDest;


    monde.visiter(iDest, jDest);

    // parcourir les 4 voisins de la cellule courante
    for (int k = 0; k < 4; k++) {
      // si le voisin est accessibles, mettre son numéro dans le tableau des choix
      if (monde.estAccessible(iDest + di[k], jDest + dj[k])) {
        choix[nbChoix] = k;
        nbChoix++;
      }
    }

    // si nbChoix == 0, Chip est coincé
    if (nbChoix > 0) {
      // choisir au hasard une des possibilités
      int k = choix[int(random(nbChoix))];
      iDest += di[k];
      jDest += dj[k];
      nbMouv++;
    } else {  //Sinon, le robot retourne sur sa position précédente enregistre dans le tableau.     
      nbMouv--;
      iDest=deplacementI[nbMouv];
      jDest=deplacementJ[nbMouv];
    }
  }

  void bouger() {
    if (estArrive() && !tresorTrouve()) {
      choisirDestination();
    }
    avancerVers(monde.xColonne(jDest), monde.yLigne(iDest));
  }
}

//Duvieu Baptiste
