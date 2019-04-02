int cercleX = 0, color1 = 0, color2 = 255, color3 = 0, taille = 0;
float rot = 0;
import processing.sound.*;
Sound file;


void setup() {
  size(500, 500);
  taille = height/2;
  background(0);
}

void draw() {
  
 //initialisation des éléments.
  background(color2,color3-color1,color1);
  fill(color1,color2,color3);
  ellipse(mouseX,  mouseY, cercleX, cercleX);

  // on incrémente cercleX
  cercleX = (cercleX +1) % int(dist(0,0,width,height)) ;
 
 //modification de la couleur en RGB
  color1 = (color1 +1) % 255 ;
  color2 = (color2 - 2) % 255 ;
  color3 = (color3 +3) % 255 ;
 
  //axe de rotation
  rot = (rot + 0.1) % TWO_PI ;
  
  //rayon du cercle
  taille = cercleX/2;
  
  line (mouseX,  mouseY,  mouseX+taille*cos(rot),  mouseY+taille*sin(rot));
  line (mouseX,  mouseY,  mouseX+taille*cos(rot+HALF_PI),  mouseY+taille*sin(rot+HALF_PI));
  line (mouseX,  mouseY,  mouseX+taille*cos(rot-HALF_PI),  mouseY+taille*sin(rot-HALF_PI));
  line (mouseX,  mouseY,  mouseX+taille*cos(rot+PI),  mouseY+taille*sin(rot+PI));
}
