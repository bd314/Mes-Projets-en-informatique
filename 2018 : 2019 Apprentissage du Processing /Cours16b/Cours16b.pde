
Snake[] followers = new Snake[10];

void setup() {
  size(800, 800);

  for (int i = 0; i < followers.length; i++) {
    followers[i] = new Snake(int(random(20, 80)),
      color(random(255), random(255), random(255)), random(2, 10),
      random(width), random(height));
  }
}

void draw() {
  background(0);
  rectMode(CENTER);
  rect(width/2, height/2, 300,20);

  for (int i = 1; i < followers.length ; i++) {
    followers[0].avancerVers(followers[followers.length - 1].getXQueue(), followers[followers.length -1].getYQueue());
    followers[i].avancerVers(followers[i-1].getXQueue(), followers[i-1].getYQueue());
    followers[i-1].dessiner();
    
  }
}
