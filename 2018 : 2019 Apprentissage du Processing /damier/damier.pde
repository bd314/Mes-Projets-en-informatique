int nb = 5, w = width/nb, h = height/nb;
boolean color1=true;
void setup() {
  size(500, 500);

}

void draw() {
  background(255);
  for (int y=0; y < nb; y++) {
    for (int x=0; x < nb; x++) {
      if (color1) {
        fill(0);
        rect(x, y*h, (x+1)*w, (y+1)*h);
        color1 = !color1;
      } else {
        fill(255);
        rect(x*w, y*h, (x+1)*w, (y+1)*h);
        color1 = !color1;
      }
    }
  }
}
