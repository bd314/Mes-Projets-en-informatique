package cours;

public class Cours2 {

	public static void main(String[] args) { 
		
		//Recupere le nombre de note donne par l'user
		int nbNote = Cours1s.lireInt("Combien avez vous eu de notes "); 

		//Declare le tableau ou vont etre stockees les valeurs
		float[] tabNote = new float[nbNote];

		//Rentre les notes
		for (int current = 0; current < nbNote; current++) { 
			tabNote[current] = Cours1s.lireFloat("Note n°" + (current + 1)
					+ " ");
			System.out.println();

		}
		//initialise la variable qui va stocke le total
		float tot = 0;
		
		//Ajoute chacunes des notes au total
		for(int current = 0; current < nbNote; current++) {
			tot = tot + tabNote[current];
			
		}
		//Effectue la division du total des notes par le nombre de note
		float moy = tot/nbNote;
		
		//Et donne la moyenne a l'user
		System.out.println("La moyenne est de: " + moy);
		
	}

}
