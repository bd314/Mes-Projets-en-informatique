// Cours n°3

boolean ledTurned = false;


void setup() {
 
  size(500, 500);
  

}



void draw() {
  colorMode(RGB,400);
  background(mouseX, mouseY, abs(mouseX-mouseY)); 
 /*Dune de Sable
fill(179, 255, 255);
noStroke();
rect(0, 0, 500, 200);  
stroke(1); 
*/

// le corps
fill(200);
ellipseMode(CENTER);
ellipse(mouseX, mouseY, 100, 100);

//cercle imbriqué
fill(231,133,24);
ellipse(mouseX, mouseY, 70, 70);
fill(200);
ellipse(mouseX, mouseY, 55, 55);

/* les trois LEDs
fill(255, 0, 0);
rect(175, 220, 10, 10);
fill(0, 255, 0);
rect(195, 220, 10, 10);
fill(0, 0, 255);
rect(215, 220, 10, 10);
*/


/* les roues
fill(255);
ellipse(180, 270, 20, 20);
ellipse(220, 270, 20, 20);
*/


// la tête
fill(200);
arc(mouseX, mouseY - 45, 70, 70, -PI, 0, CHORD);

// la caméra
fill(70);
ellipse(mouseX, mouseY-60, 20, 20);
fill(0);
ellipse(mouseX, mouseY-60, 12, 12);





// la led
if (ledTurned == false){

fill(255,0,0);
ellipse(mouseX+20, mouseY-60, 6, 6);
ledTurned=true;
delay(60);

}
else{
fill(255);
ellipse(mouseX+20, mouseY-60, 6, 6);
ledTurned=false;
delay(60);
}


//fill(240);
//ellipse(226, 180, 4, 4);
//fill(240);
//ellipse(224, 18, 2, 2);

// l'antenne
strokeWeight(3);
line(mouseX - 5, mouseY - 80, mouseX - 5, mouseY - 90);
strokeWeight(3);
line(mouseX + 5, mouseY - 80, mouseX + 5, mouseY - 100);

// anneaux à l'intérieur

//BAS DROIT
strokeWeight(2);
line(mouseX + 20, mouseY +20, mouseX + 5, mouseY + 5);
//BAS GAUCHE
strokeWeight(2);
line(mouseX - 20, mouseY +20, mouseX - 5, mouseY + 5);
//HAUT DROIT
strokeWeight(2);
line(mouseX + 20, mouseY -20, mouseX + 5, mouseY - 5);
//HAUT GAUCHE
strokeWeight(2);
line(mouseX - 20, mouseY -20, mouseX - 5, mouseY - 5);

if (mousePressed == true){
  println("coordonnée de x: ",mouseX," coordonnée de y: ",mouseY);

}
}
