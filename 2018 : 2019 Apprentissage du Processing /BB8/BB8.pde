// Cours n°2

boolean ledTurned = false;


void setup() {
 
  size(500, 500);
  background(255, 255, 102); 

}



void draw() {
 //Dune de Sable
fill(179, 255, 255);
noStroke();
rect(0, 0, 500, 200);  
stroke(1); 


// le corps
fill(200);
ellipseMode(CENTER);
ellipse(200, 240, 100, 100);

//cercle imbriqué
fill(231,133,24);
ellipse(200, 240, 70, 70);
fill(200);
ellipse(200, 240, 55, 55);

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
arc(200, 195, 70, 70, -PI, 0, CHORD);

// la caméra
fill(70);
ellipse(200, 180, 20, 20);
fill(0);
ellipse(200, 180, 12, 12);





// la led
if (ledTurned == false){

fill(255,0,0);
ellipse(220, 180, 6, 6);
ledTurned=true;
delay(60);

}
else{
fill(255);
ellipse(220, 180, 6, 6);
ledTurned=false;
delay(60);
}


//fill(240);
//ellipse(226, 180, 4, 4);
//fill(240);
//ellipse(224, 18, 2, 2);

// l'antenne
strokeWeight(3);
line(195, 150, 195, 160);
strokeWeight(3);
line(205, 140, 205, 160);

// anneaux à l'intérieur

//BAS DROIT
strokeWeight(2);
line(220, 260, 205, 245);
//BAS GAUCHE
strokeWeight(2);
line(180, 260, 195, 245);
//HAUT DROIT
strokeWeight(2);
line(220, 220, 205, 235);
//HAUT GAUCHE
strokeWeight(2);
line(180, 220, 195, 235);

if (mousePressed == true){
  println("coordonnée de x: ",mouseX," coordonnée de y: ",mouseY);

}
}
