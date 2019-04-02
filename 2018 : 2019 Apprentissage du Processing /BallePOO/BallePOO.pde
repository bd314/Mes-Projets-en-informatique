Balle balle1;

void setup() {
  size(400, 400);

  balle1 = new Balle(width/2,10,10,0,0.5);

}

void draw() {
  background(255);

  balle1.dessiner();
  balle1.bouger();
  balle1.rebondir();
  
  
}
