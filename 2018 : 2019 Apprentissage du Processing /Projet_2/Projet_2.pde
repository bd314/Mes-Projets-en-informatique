int posX, posY, lPosX, lPosY, cometeX, cometeY, taille = 50, timer, vitesse, scoreNb, vieNb = 3, reset= 0, rechargement, objectif;
boolean apparition, game = true, gameSucess = false;

/* Pour envoyer le missile, utiliser la touche a.
 Pour déplacer, utiliser les flèches directionnels
 Recharge de quelques secondes du laser
 
 
 */

void setup() {
  size(1000, 500);
  background(0);

  //défintion des variables dépendantes de la fenêtre.
  posX = width/8;
  posY = height/2;  
  vitesse = 6;     //Choix de la vitesse de la soucoupe
  objectif = 2500; //Choix de l'objectif en score
}

//voir détails des fonctions dans la déclaration même.

void draw() {
  if (game == true) {  //Si le jeu est encore actif
    resetApparence();


    //rechargement jusqu'à utilisation du laser
    rechargement++;
    affichage();
    soucoupe(posX, posY);
    laser();

    if (apparition == true ) {  //Si une comète est déjà en activité, celle-ci se déplace
      comete(cometeX, cometeY, taille);
      cometeX-=6;
    } else {  //Sinon, une comète apparait
      cometeApparition();
    }


    if (vieNb <= 0) {  //Si les vies sont inférieurs ou égal à 0, la partie s'arrête
      game = !game;
    } else if (scoreNb > objectif ) {  // Si le score dépasse l'objectif, la partie est gagnée.
      game = false;
      gameSucess =true;
    }

    if ( cometeX <= 0 ) {  //Si la comète depasse le coté droit, on perd une vie.
      vieNb--;
      apparition = !apparition;
    }
  } else if (gameSucess) { // Si la partie est déclaré comme gagné
    background(120);
    fill(0, 255, 0);
    textSize(26);
    text("VOUS AVEZ GAGNÉ", width/2 - width/10, height/2);
  } else { // Si elle n'est plus active, et pas gagnante.
    background(120);
    fill(255, 0, 0);
    textSize(26);
    text("VOUS AVEZ PERDU", width/2 - width/10, height/2);
    textSize(14);
    text("appuyez sur une touche pour recommencer....", width/2 - width/7, height/2 +10);
    delay(2);
    if (keyPressed) {
      resetScore();
    }
  }
}

void cometeApparition() {  //Fais appararaitre la comète
  resetApparence();
  cometeX = width+1/2*width;
  cometeY =  (int) random(height); 
  comete(cometeX, cometeY, (int) random(30));
  apparition = true;
  timer = (int) random(360);
}

void comete(int X, int Y, int epais) {  //déplace la comète
  resetApparence();
  fill(50);

  ellipse(cometeX, cometeY, 1.5*epais, 1.5*epais);

  fill(150);
  ellipse(X+(int) random(epais/2), Y+(int) random(epais/2), (int) random(epais/2), (int) random(epais/2));
  ellipse(X-(int) random(epais/2), Y-(int) random(epais/2), (int) random(epais/2), (int) random(epais/2));
  ellipse(X+(int) random(epais/2), Y-(int) random(epais/2), (int) random(epais/2), (int) random(epais/2));
  ellipse(X-(int) random(epais/2), Y+(int) random(epais/2), (int) random(epais/2), (int) random(epais/2));
}

void soucoupe(int X, int Y) {  //Dessin de la soucoupe
  background(0);
  affichage();
  resetApparence();
  fill(120);  //couleur grise du corps

  if (keyPressed && keyCode == UP) {  //si la flèche haute est pressée, le vaisseau augmente en altitude.
    if (posY>0 +taille/2) {  //limitation des bords supériers.
      posY-=vitesse;
    }
  } else if (keyPressed && keyCode == RIGHT) {  //si la flèche droite est pressée, le vaisseau avance.
    if (posX<width -taille/2) {  //limitation des bords de droite.
      posX+=vitesse;
    }
  } else if (keyPressed && keyCode == LEFT) {  //si la flèche gauche est pressée, le vaisseau recule.
    if (posX>0 +taille/2) {  //limitation des bords de gauche.
      posX-=vitesse;
    }
  } else if (keyPressed && keyCode == DOWN) {  //si la flèche haute est pressé, le vaisseau descend.
    if (posY<height -taille/2) {  //limitation des bords inférieur.
      posY+=vitesse;
    }
  }

  // dessin de la soucoupe.
  noStroke();
  //corps inférieur
  rectMode(CENTER);  
  rect(X, Y+5, 90, 10);
  rect(X, Y+10, 105, 10);
  triangle(X+30, Y, X+45, Y, X+75, Y+20);
  triangle(X-30, Y, X-45, Y, X-75, Y+20);

  //tracés de lévitation
  for (int i=30; i<70; i+=10) {
    fill(0, 255, 255);
    ellipse(X, Y+i, i, 10);
  }

  //dessin du cockpit.
  stroke(255);
  fill(0, 180, 255);
  arc(X, Y, 80, 65, PI, TWO_PI, CHORD);
  for (int i=-30; i<=30; i+=15) {
    fill(255);
    ellipse(X+i, Y-15, 10, 10);
  }
}

void affichage() {  //Affichage du texte.
  resetApparence();
  String tex = "Attention à protéger le vaisseau ! 3 météorites passées, et l'empire tombera....";
  text(tex, width/2, 30, width/2+20, 40);


  String score = "score: " + scoreNb;
  text(score, 2*width - 125, 30, 2*width -50, 40);
  String objectiftex = "objectif: " + objectif + " points";
  text(objectiftex, 2*width - 200, 55, 2*width -50, 65);

  String vie = "vie restante: " + vieNb;
  text(vie, width, 50, 2*width -100, 60);

  if (rechargement>40) {  //previens pour le laser
    String las = "Laser disponible!" ;
    text(las, width, 75, 2*width -100, 90);
  }
}

void resetApparence() { //permet d'éviter les scintillements.
  strokeWeight(1);
  stroke(255);
}

void resetScore() {  //remise a zéro des variables de jeu pour recommencer le jeu.
  game = true; 
  gameSucess = false;
  rechargement = 0;
  scoreNb = 0;
  vieNb = 3;
}

void laser() {  //tir du laser

  if (rechargement > 40) {
    //controle du laser par la touche du clavier A minuscule
    if (keyPressed && key == 'a') {

      lPosX = posX;
      lPosY = posY;

      while (lPosX<width+5 ) {
        stroke(255, 0, 0);
        strokeWeight(5);
        line(lPosX+5, lPosY, lPosX + 5, lPosY);
        lPosX+=5;
        rechargement=0;

        if (lPosY < cometeY + taille/2 ||  lPosY < cometeY + taille/2 ) {
          apparition = false;
          scoreNb++;
        }
      }
    }
  }
}
