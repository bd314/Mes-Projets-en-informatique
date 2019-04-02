boolean victory = false;

Hitbox Environnement;
World Monde;
Menu Menu;
Tools Actions;
BB8 robot;

void setup() {
  size(700, 700);

  Environnement = new Hitbox(width-3*width/10, height - 3 *height/10, color(255, 0, 0), 100) ;
  Monde = new World();
  Menu = new Menu();
  Actions = new Tools();
  robot = new BB8(color(231, 133, 24));
}

void draw() {
  //Utilisation des classes pour produire le jeux.

  if (Menu.affichage) {
    Menu.afficher();
  } else if (victory) {
    Menu.victoire();
  } else {
    Monde.dessiner();
    Environnement.creer();
    Environnement.bouger();
    Actions.destroy();
  }
}
