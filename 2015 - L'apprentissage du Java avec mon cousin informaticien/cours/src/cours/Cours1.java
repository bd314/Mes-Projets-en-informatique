package cours;

public class Cours1 {
	
	public static void main(String[] args) {
		// Exo 1
		int[] tableau = new int [10];
		tableau[0] = 3;

//		System.out.println(tableau[0]);
		
		// Exo 2
		char[] tabString = "Je m'appelle Baptiste.".toCharArray();
		int longtab = tabString.length;
		int nb = 0;
		//System.out.println(tabString[nb]);
		
		//TP afficher le contenu d'un tableau de caractères
		
		while (nb<longtab) {
			System.out.print(tabString[nb]);
			nb++;
		}
		
		
		
	}	

}
