package cours;

import java.util.Scanner;

public class JeuDeNim {


	public static void graph(int nombreDeBaton) { // Affichage de l'état du jeux
		
		for(int current= 0; current < nombreDeBaton;current++){
			System.out.print("|");
		}
		System.out.println();

	}

	public static int lireInt(String message) { // Rajouter le texte à une question
												

		System.out.print(message + ": ");
		return lireInt();

	}

	public static int lireInt() { // Fonction pour récupérer une valeur sans decimal
									

		Scanner sc = new Scanner(System.in);

		int nb = sc.nextInt();

		return nb;

	}

	public static int choix(String name,int nombreDeBaton) { // Choix du nombre de batton
		
		int choix = 0;
		while (choix-nombreDeBaton>0 ||( choix != 1 && choix != 2 && choix != 3)) {
			choix = lireInt(name + ": Quel est votre choix ? [1:2:3]");
				
		}
		
		return choix;
	}

	public static void main(String[] args) {

		int nombreDeBaton = 10;
		String nomj;
		
		int nbj=lireInt("Combien il y a t'il de joueur : ");	//Recuperation du nombre de joueur
		String nom[]=new String[nbj];	//creation du tableau de String
		
		for(int current=0;current!=nbj;current++){	//Recuperation des noms des joueurs en fonction de la variable nbj
			nom[current]=Cours1s.lireString("Comment s'appelle le joueur n°"+(current+1));
		}
		
		int statut = 0;	//Gestion des tours de chaques joueurs
		
		boolean fini=false;
		while (!fini) {
			
			nomj=nom[statut];
			
			
			graph(nombreDeBaton); // Affichage de l'état du jeux
			System.out.println(nombreDeBaton);	
			
			
			if(nombreDeBaton>1){
				int choix = choix(nomj,nombreDeBaton); // Demande au joueur
				nombreDeBaton -= choix;	
			}
			else{
				System.out.println(nomj + " a perdu.");
				fini=true;
			}
			
			if (statut==nbj-1){
				statut=0;
			}
			else{
				statut++;
			}
			
			/*Instructions:
		
		cb de joueur(definir avant) +stocke leur nom dans un tableau de String +remplacer le boolean par un int
		
			*/
		}
	}
}
