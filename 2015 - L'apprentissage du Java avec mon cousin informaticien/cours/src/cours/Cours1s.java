package cours;

import java.util.Scanner;

public class Cours1s {

	
	public static float lireFloat(String message) {
		
		System.out.print(message + ": ");
		return lireFloat();
		
	}
	
	
	public static int lireInt(String message) {
		
		System.out.print(message + ": ");
		return lireInt();
		
	}
	
	
	public static String lireString(String message) {
		
		System.out.print(message + ": ");
		return lireString();
		
	}
	
	/**
	 *
	 * @return float entr� par l'user dans la console
	 */
	
	public static float lireFloat() { //Fonction pour r�cup�rer une valeur  d�cimal

		Scanner sc = new Scanner(System.in);

		float nb = sc.nextFloat();

		return nb;

	}
	
	/**
	 *
	 * @return int entr� par l'user dans la console
	 */

	public static int lireInt() { //Fonction pour r�cup�rer une valeur sans d�cimal

		Scanner sc = new Scanner(System.in);

		int nb = sc.nextInt();

		return nb;

	}
	
	public static String lireString() { // Fonction pour r�cup�rer une chaine de caract�re.
		
		Scanner sc = new Scanner(System.in);
		
		String txt = sc.nextLine();
		
		return txt;
		
		
	}

	public static void main(String[] args) {

		/**System.out.println("Valeur de a = "); 		Cours1_suite
		float a = lireFloat();
		System.out.print(a);

		System.out.println("Valeur de b = ");
		int b = lireInt();
		System.out.print(b);
		**/
		
		// TP
		
		System.out.println("Formulaire de saisie: Poids/Age:Nom\n\n");
		System.out.println("Quel est votre poids ? ");
		float poids = lireFloat();
		System.out.println("Quel est votre �ge ? ");
		int age = lireInt();
		System.out.println("Comment vous appelez vous ?");
		String nom = lireString();
		
		System.out.println("Vous pesez : " + poids +"kg et vous avez : " + age + "ans et pour finir votre nom est : " + nom);
		
		/* Comment le faire.
		 * Formulaire de saisie, Poids en float Age int Bonus: Nom
		 *
		 *
		 * Entrez votre age: 
		 * -scanner
		 * -liste d'une variable
		 * Entrez votre poids:
		 * ==
		 * Entrez votre nom:
		 * ==
		 * Vous vous appellez ..... jai la flemme de continuer
		 * r�cuperer a partir de la liste
		 */

	}

}
