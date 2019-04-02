Bande[] bandes = new Bande[100];
Voiture[] voitures = new Voiture[1];

void setup() {
  size(400, 400);
  for (int i = 0; i < bandes.length; i++) {
    bandes[i] = new Bande();
  }
  for (int i = 0; i < voitures.length; i++) {
    voitures[i] = new Voiture(0, i * 4, random(1, 5), color(i * 2), 8);
  }
}

void draw() {
  background(100);
  for (int i = 0; i < bandes.length; i++) {
    bandes[i].bouger();
    
  }
  for (int i = 0; i < voitures.length; i++) {
    voitures[i].dessiner();
    voitures[i].bouger();
    for (int b = 0; b < bandes.length; b++) {
      bandes[b].rollover(voitures[i].x, voitures[i].y);
      bandes[b].dessiner();
    }
  }
}
