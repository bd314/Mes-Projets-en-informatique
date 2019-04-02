package objets;

public class Personne {

	private char sexe;
	private String nom;
	private Personne mere;
	private Personne pere;

	public Personne(char sexe, String nom) {

		this.sexe = sexe;
		this.nom = nom;

	}
	
	public String getNom() {
		return this.nom;
		
	}
	
	public void setNom(String nom) {
		this.nom = nom;
		
	}

	public void setParent(Personne mere, Personne pere) {

		this.pere = pere;
		this.mere = mere;

	}

	public boolean estFrere(Personne p) {

		return this.pere == p.pere && this.mere == p.mere;

	}

	public boolean estParent(Personne p) {

		return this.pere == p || this.mere == p;

	}

	public boolean estPetitEnfant(Personne p) {
		return this.mere.estParent(p) || this.pere.estParent(p);

	}

	public boolean estCousin(Personne p) {

		return this.pere.estFrere(p.mere) || this.mere.estFrere(p.pere)
				|| this.mere.estFrere(p.mere) || this.pere.estFrere(p.pere);

	}

	public static void main(String[] args) {

		Personne baptiste = new Personne('M', "Baptiste");
		Personne sophie = new Personne('F', "Sophie");
		Personne stephane = new Personne('M', "Stephane");
		Personne emeline = new Personne('F', "Emeline");

		Personne petit = new Personne('I', "Alfred"); // Gosse Baptiste
		Personne petite = new Personne('F', "Lily"); // Gosse Emeline
		Personne inconnue = new Personne('F', "Huguette"); // Copine Baptiste
		Personne inconnu = new Personne('M', "Adolf"); // Copain Emeline

		baptiste.setParent(sophie, stephane); // Identique
		emeline.setParent(sophie, stephane);

		System.out.println(baptiste.nom + " & " + emeline.nom
				+ " sont frere et soeur : " + baptiste.estFrere(emeline));

		/*
		 * Different baptiste.setParent(inconnue , inconnue);
		 * emeline.setParent(sophie , stephane); System.out.println(baptiste.nom
		 * + " & " + emeline.nom + " sont frere et soeur : " +
		 * baptiste.estFrere(emeline));
		 */

		System.out.println(stephane.nom + " est l'un des parents de "
				+ baptiste.nom + " : " + baptiste.estParent(stephane));
		System.out.println(inconnue.nom + " est l'un des parents de "
				+ baptiste.nom + " : " + baptiste.estParent(inconnue));

		petit.setParent(baptiste, inconnue);
		petite.setParent(emeline, inconnu);

		System.out.println(stephane.nom + " est l'un des grands-parents de "
				+ petit.nom + " : " + petit.estPetitEnfant(stephane));
		System.out.println(petit.nom + " est l'un des cousin(e) de "
				+ petite.nom + " : " + petit.estCousin(petite));

	}

}