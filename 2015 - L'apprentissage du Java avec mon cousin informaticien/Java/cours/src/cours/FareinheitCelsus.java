package cours;

import java.util.Scanner;

public class FareinheitCelsus {
	public static int lireInt() { //Fonction pour récupérer une valeur sans décimal

		@SuppressWarnings("resource")
		Scanner sc = new Scanner(System.in);

		int nb = sc.nextInt();

		return nb;

	}
	public static int lireInt(String message) { // Rajouter le texte à une question
		

		System.out.print(message + ": ");
		return lireInt();

	}
	public static double arrondi(double A, int B) {
		return (double) ((int) (A * Math.pow(10, B) + .5)) / Math.pow(10, B);
	}

	public static void main(String[] args) {
		
		int choix = 0;
		System.out
				.println("CONVERTISSEUR DEGRÉS CELSIUS ET DEGRÉS FAHRENHEIT\n"
						+ "-------------------------------------------------");
		
		
		while (choix != 1 && choix != 2) {
			
			System.out.println("Choissisez le mode de conversion :\n"
					+ "1 - Convertisseur Celsius - Fareinheit\n"
					+ "2 - Convertisseur Farenheit - Celsius");
			System.out.println("test");
			
			int cho = lireInt("Votre choix: ");
			System.out.println(cho);

		}
		System.out.println("hep");

		// }while ();

	}

}
