class World {
  // attributs
  color couleur;
  float x, y, x1, y1;
  float type;
  int taille = width/10;
  color currentc;
  int curseur;


  /*Organisation des blocks dans l'espace, chaque block correspond a un identifiant.
   Organisation du tableau "à la dure" dans une volonté de proposer un monde interchangeable, et de transformer des valeurs en visuelles.
   Grâce aux algorithmes, le Labyrinth peut être deformé à volonté, et continuer de respecter des logiques de murs, et d'espaces vides.  
   */



  int[] blocks = { 

    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 
    1, 0, 0, 0, 0, 0, 0, 0, 3, 1, 
    1, 0, 0, 0, 0, 0, 0, 3, 5, 1, 
    1, 0, 0, 0, 0, 0, 0, 3, 3, 1, 
    1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 
    1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 
    1, 3, 3, 0, 0, 0, 0, 0, 0, 1, 
    1, 3, 3, 3, 3, 0, 0, 0, 0, 4, 
    1, 3, 3, 3, 3, 0, 0, 0, 0, 4, 
    1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 

  };


  // constructeurs
  World() {
    x = 0;
    y = 0;
    type = 0;
    // 0 air, 1 dirt, 2 wood
  }

  World(float x, float y, int type) {
    this.x = x;
    this.y = y - taille/2;
    this.type = couleur;
  }



  //Cakcul de l'emplacement d'une case dans le tableau, en fonction de sa position X de case, et Y de case sur une grille ici 10x10.
  int gridNav(float x, float y) {
    float grid;
    x = int(x/(width/10));
    y = int(y/(width/10));
    grid = 20 + (y - 1) *10 + x;

    return int(grid);
  }


  //fonctions pour vérifier si un block est occupé ou non.
  boolean nextBlock(int current, float direction) {
    boolean result;
    if (Monde.gridNav(Environnement.x, Environnement.y)+1 == 90) {
      victory=true; 
      result =true;
    }
    if ( blocks[int(current+direction)] == 1 || blocks[int(current+direction)] == 3 || blocks[int(current+direction)] == 4 || blocks[int(current+direction)] == 5 || blocks[int(current+direction)] == 6    ) {
      result = true;
    } else {
      result = false;
    }

    return !result;
  }




  void dessiner() {

    rectMode(CORNERS);

    //prise en charge du 0 des tableaux.
    int i = -1;
    //création d'une grille
    for (int y1 = 0; y1<height; y1 += taille) {
      for (int x1 = 0; x1<width; x1 += taille) {
        //determination des différents types de blocs et couleurs
        i++;
        if (blocks[i] == 0 || blocks[i] == 6 || blocks[i] == 4  ) {
          fill(41, 61, 61);
          currentc = color(41, 61, 61) ;
        } else if (blocks[i] == 1) {
          fill(20, 31, 31);
          currentc = color(20, 31, 31) ;
        } else if (blocks[i] == 2) {
          fill(102, 51, 0);
          currentc = color(102, 51, 0) ;
        } else if (blocks[i] == 3|| blocks[i] == 5) {
          fill(153, 102, 0);
          currentc = color(153, 102, 0);
        } 

        //Si la souris se déplace sur la case, elle est entourée de rouge

        if (mouseX>x1 && mouseX < x1+taille && mouseY > y1 && mouseY < y1+taille) {
          int x1s, y1s;
          x1s = x1 +4;
          y1s = y1+4;
          curseur = Monde.gridNav(mouseX, mouseY);

          //affichage du curseur en conservant la couleur de fond.
          fill(255, 0, 0);
          rect(x1, y1, x1+taille, y1+taille);
          fill(currentc);
          rect(x1s, y1s, x1s+taille-8, y1s+taille-8);


          // cas particulier pour ne pas iterer le design de la case
          if (blocks[i] == 6) {
            fill(122);
            rect(x1+taille-10, y1+10, x1+taille, y1+taille-10);
          } else if (blocks[i] == 4) {
            fill(122);
            rect(x1+taille/4, y1+4, x1+taille/4+5, y1+taille-4);
            rect(x1+taille-taille/4, y1+4, x1+taille-taille/4-5, y1+taille-4);
          } else if (blocks[i] == 3|| blocks[i] == 5) { 
            // les caisses ou caisses cachées.          
            fill(128, 85, 0);
            rect(x1+5, y1+taille/4+5, x1+taille-5, y1+taille/4);
            rect(x1+taille-taille/4, y1+5, x1+taille-taille/4-5, y1+taille-5);
          }
        } 


        //design des cases plus complexes.
        else if (blocks[i] == 3 || blocks[i] == 5) {
          rect(x1, y1, x1+taille, y1+taille);
          fill(128, 85, 0);
          rect(x1, y1+taille/4, x1+taille, y1+taille/4+5);
          rect(x1+taille-taille/4, y1, x1+taille-taille/4-5, y1+taille);
          rect(x1+taille, y1, x1+taille-5, y1+taille);
          rect(x1, y1+5, x1+taille, y1);
        } else if (blocks[i] == 4) {
          rect(x1, y1, x1+taille, y1+taille);
          fill(122);
          rect(x1+taille/4, y1, x1+taille/4+5, y1+taille);
          rect(x1+taille-taille/4, y1, x1+taille-taille/4-5, y1+taille);
          rect(x1+taille, y1, x1+taille-5, y1+taille);
          rect(x1, y1, x1+5, y1+taille);
        } else if (blocks[i] == 6) {
          rect(x1, y1, x1+taille, y1+taille);
          fill(122);
          rect(x1+taille-10, y1+10, x1+taille, y1+taille-10);
        } else { // sinon design simple
          noStroke();
          rect(x1, y1, x1+taille, y1+taille);
        }
      }
    }
  }
}
