//Cours n°4

boolean ledTurned = false;


void setup() {
background(255, 255, 102); 
  size(500, 500);
}



void draw() {

 
}
void mousePressed() {
   // anneaux à l'intérieur
background(255, 255, 102); 
  //BAS DROIT
  strokeWeight(2);
  line(mouseX + 20, mouseY +20, mouseX, mouseY);
  //BAS GAUCHE
  strokeWeight(2);
  line(mouseX - 20, mouseY +20, mouseX, mouseY);
  //HAUT DROIT
  strokeWeight(2);
  line(mouseX + 20, mouseY -20, mouseX, mouseY);
  //HAUT GAUCHE
  strokeWeight(2);
  line(mouseX - 20, mouseY -20, mouseX, mouseY);
  
}
