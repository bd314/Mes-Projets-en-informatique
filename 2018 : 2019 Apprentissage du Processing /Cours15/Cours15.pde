int[] nbOcc = new int[100];

void setup() {
  size(800, 400);

  // On initialise tout à zéro
  for (int i = 0; i < nbOcc.length; i++) {
    nbOcc[i] = 0;
  }
}

void draw() {
  background(122);
  // On génère un nombre aléatoire
  int r = int(random(nbOcc.length));
   
  // On met à jour le nombre de ses occurrences
  nbOcc[r]++;
  int x1=0;
  int moyennetemp=0;
  int moyenne;
  for (int i=0; i< nbOcc.length; i++) {
    rectMode(CORNERS);
    stroke(0);
    
    rect(i*(width/nbOcc.length),height-nbOcc[i],i*(width/nbOcc.length)+(width/nbOcc.length),height);
    
    
    
  }
  for (int i=0; i< nbOcc.length; i++) {
    moyennetemp += nbOcc[i];

    stroke(255,0,0);
    
    
    
    
    
  }
  moyenne = height - moyennetemp / 99;
  line(0,moyenne,width,moyenne);
}
