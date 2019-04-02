int position;
float angle, angle2, angle3;
void setup() {
  fill(123);
  size(500, 500);
  angle = -PI;
  angle2 = -PI;
  angle3 = PI;
  fill(255);
  ellipse(width/2, height/2, width-50, height-50);
} 
void draw() {
  ellipseMode(CENTER);
  fill(255);

  while (angle < TWO_PI ) {
    stroke(255,0,0);
    strokeWeight(5);
    line(width/2 +(width/2-70)*cos(angle), height/2 + (height/2-70)*sin(angle), width/2 + (width/2-50)*cos(angle), height/2 + (height/2-50)*sin(angle));
    angle+= PI /6;
  }
  while (angle2 < TWO_PI ) {
    stroke(0);
    strokeWeight(1);
    line(width/2 +(width/2-70)*cos(angle2), height/2 + (height/2-70)*sin(angle2), width/2 + (width/2-50)*cos(angle2), height/2 + (height/2-50)*sin(angle2));
    angle2+= PI /30  ;
  }
}


































































































/* float color1, x;
 void setup() {
 
 size(200, 200);
 background(255);
 noStroke();
 x = -PI;
 color1=0;
 }
 
 
 void draw() {
 // camembert
 colorMode(RGB);
 while ( x <= TWO_PI) {
 fill(color1);
 arc(width/2, width/2, width/2-10, width/2-10, 0, x, PIE);
 x += QUARTER_PI;
 color1 += 25;
 }
 
 }
 
 
 
 
 
 
 int xLine, accel;
 
 
 void setup() {
 fill(123);
 size(1000, 100); 
 xLine = 5;
 } 
 void draw() {
 while ( xLine < width ) {
 
 if (xLine<width/2) {
 accel += 1;
 } else {
 accel -= 1;
 }
 xLine += 1 + accel/3;
 line (xLine, 0, xLine, height); 
 }
 }
 
 */
