import java.util.Scanner;


public class Compte_a_reboure {

	public static void main(String[] args) {

	//Competence des variables & des saisies de texte ainsi que des boucles
	int nb = 0 ;
	@SuppressWarnings("resource")
	Scanner sc = new Scanner(System.in);
	System.out.println("Veuillez saisir le temps du compte a rebour : ");
	nb = sc.nextLine().charAt(nb);
	System.out.println("Vous avez saisi : " + nb + " secondes");
	System.out.println("Lancement d'un compte a reboure ...");
	while (nb == 0)
	{
		nb = nb - 1;
		System.out.println(nb);
	}

	
	}

}
