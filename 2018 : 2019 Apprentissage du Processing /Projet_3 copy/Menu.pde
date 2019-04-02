class Menu {
  //attribut
  boolean affichage = true;

  void afficher() {
    //Menu d'accueil
    background(122);
    
    fill(255);
    rectMode(CORNERS);
    rect(width/2 - width/5, height/2 - height/20, width/2 + width/5, height/2 + height/20);
    textAlign(CENTER, CENTER);    
    fill(0);  
    
    //Si la souris passe au dessus du bouton.
    if ( mouseX > width/2 - width/5 && mouseY > height/2 - height/20 && mouseX < width/2 + width/5 && mouseY < height/2 + height/20) {
      fill(255, 0, 0);
      if (mousePressed) {
        affichage = false;
      }
    }
    text("Jouer!", width/2,height/2);
    fill(0);
    text("Alerte maximale, l'empire a capturé BB8. Votre mission, si vous l'acceptez, sera de libérer BB8. ", width/2, height/5);
    text("En trouvant un fameux bouton caché dans les cageaux....  Existe-t-il? Bon courage, et sortez de cette prison.", width/2, height/4);
    text("Comment utiliser ce jeux ? Voici, les contrôles:", width/2, height-height/3);
    text("- Utiliser les flèches directionnels pour se déplacer de case en case.", width/2, height-height/4);
    text("- Utiliser le clic gauche pour intéragir avec l'environnement.", width/2, height-height/4.5);
  }

  void victoire() {
    //Menu lorsque le joueur a gagné le jeux.
    background(120);
    fill(0, 255, 0);
    textSize(26);
    text("Félicitations, vous avez réussi à vous échapper!", width/2, height/2);
  }
}
