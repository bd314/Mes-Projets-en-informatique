class Cellule {
  float x, y; // position
  float w, h; // taille
  int etat;

  Cellule(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    etat = 0;
  }

  void click(int mx, int my) {
    if (x <= mx && mx < x + w && y <= my && my < y + h) {
      if (etat ==0) {
        if (tours) {
          etat = 1 ;
        } else if (!tours) {
          etat=2;
        } else {
          fill(0);
        }
        tours = !tours;
      }
    }
  }



  void dessiner() {
    stroke(0);
    fill(255);
    rect(x, y, w, h);
    if (etat == 0) {
    } else if (etat==1) {
      ellipseMode(CENTER);
      ellipse(x+w/2, y+h/2, w/2, h/2);
    } else if (etat==2) {
      line(x+10, y+10, x+w-10, y+h-10);
      line(x+w-10, y+10, x+10, y+h-10);
    }
  }
}
