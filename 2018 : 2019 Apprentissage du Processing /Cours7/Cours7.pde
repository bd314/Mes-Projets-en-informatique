/* Exercice 7.1
 Votre enseignant a deux oreilles et mesure 3 m.    F
 Votre enseignant a deux oreilles ou mesure 3 m.    V
 Votre enseignant a deux oreilles et ne mesure pas 3 m.    V
 Votre enseignant a deux oreilles ou ne mesure pas 3 m.    V
 Votre enseignant n'a pas deux oreilles et ne mesure pas 3 m.     F
 Votre enseignant n'a pas deux oreilles ou ne mesure pas 3 m.     V
 
 
 Exercice 7.2
 x = 5 et y = 6.
 
 !(x > 6)             V                    
 (x == 6 && x == 5)   F
 (x == 6 || x == 5)   V 
 (x > -1 && y < 10)   V
 
 Exercice 7.3
 
 (x > 10 && x < 5)
 x ne peut pas etre superieur à 10 et inférieur à 5.
 
 Exercice 7.4
 
 
 int x = 50;
 int y = 50;
 int w = 100;
 int h = 75;
 
 void setup() {
 size(200, 200);
 }
 
 void draw() {
 background(0);
 frameRate(1);
 
 stroke(255);
 if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
 fill(255,123,0);
 } else {
 fill(0,123,0);
 }
 rect(x, y, w, h);
 }
 
 Exercice 7.5
 */

int increase1, increase2, increase3, increase4;
void setup() {
  size(200, 200);
}

void draw() {
  // étape 1
  background(255);

  // étape 2
  stroke(0);
  line(width / 2, 0, width / 2, height);
  line(0, height / 2, width, height / 2);

  noStroke();
  fill(increase1);
  rect(0, 0, width / 2, height / 2);
  fill(increase2);
  rect(width / 2, 0, width / 2, height / 2);
  fill(increase3);
  rect(0, height / 2, width / 2, height / 2);
  fill(increase4);
  rect(width / 2, height / 2, width / 2, height / 2);

  fill(0);
  
  constrain(increase1, 0, 255);
  increase1++;
  constrain(increase2, 0, 255);
  increase2++;
  constrain(increase3, 0, 255);
  increase3++;
  constrain(increase4, 0, 255);
  increase4++;

  if (mouseX < width / 2 && mouseY < height / 2) {
    rect(0, 0, width / 2, height / 2);
    increase1-=11;
  } else if (mouseX > width / 2 && mouseY < height / 2) {
    rect(width / 2, 0, width / 2, height / 2);
    increase2-=11;
  } else if (mouseX < width / 2 && mouseY > height / 2) {
    rect(0, height / 2, width / 2, height / 2);
    increase3-=11;
  } else {
    // quadrant inférieur droit
    rect(width / 2, height / 2, width / 2, height / 2);
    increase4-=11;
  }
}
