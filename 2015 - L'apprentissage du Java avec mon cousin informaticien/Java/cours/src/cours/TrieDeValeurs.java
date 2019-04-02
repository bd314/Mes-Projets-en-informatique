package cours;

import java.util.Scanner;

public class TrieDeValeurs {

	public static int lireInt(String message) { // Rajouter le texte à une question
		

		System.out.print(message + ": ");
		return lireInt();

	}

	public static int lireInt() { // Fonction pour récupérer une valeur sans
									// decimal

		Scanner sc = new Scanner(System.in);

		int nb = sc.nextInt();

		return nb;

	}

	public static void main(String[] args) {
		
		int nbv = lireInt("Combien il y a t'il de valeur");
		int [] valeurs = new int[nbv];
		int [] coef = new int[nbv];
		int [] fin = new int[nbv];
		for (int current=0;current!=nbv;current++){
			valeurs[current]=lireInt("Quel est la valeur du nombre n°" + (current+1));
		}
		
		for (int load=0;load!=nbv;load++){
			for(int v=0;v!=nbv;v++){
				if (valeurs[load]==valeurs[v]){
					System.out.println("");
				}
				else{
					if (valeurs[load]>valeurs[v]){
						System.out.println("Plus grand"+valeurs[load]+valeurs[v]);
						coef[load]+=1;
						
					}
					else{
						System.out.println("Plus petit"+valeurs[load]+valeurs[v]);
					}
				}	
			}
			if (fin[coef[load]]!=0){
				fin[coef[load]+1]=valeurs[load];
			}
			else{
				fin[coef[load]]=valeurs[load];
			}
			System.out.println("Fin de la verif--"+coef[load]);

			
		
		}
	for(int stat=0;stat<nbv;stat++){
		
		System.out.print(fin[stat]+" < ");
		
		}
	}

}
