package objets;

public class Voiture {

	String model;
	int puissance;
	int essence;
	int reservoir;
	int resistance;
	
	public Voiture(String model , int puissance, int reservoir, int resistance){
		
		this.model = model;
		this.puissance = puissance;
		this.essence = 0;
		this.reservoir = reservoir;
		this.resistance = resistance;
		
	}
	
	public void faireLePlein() {
		
		this.essence = this.reservoir;
	
	}
	
	public Voiture collision(Voiture autre){
		
		int resultat = this.resistance - autre.resistance;
		if(resultat>0){
			return this;
		}
		else if(resultat<0){
			return autre;
		}
		return null;
		
	}
	
	public String toString() {
		
		return model;
		
	}
	
	
	
	public static void main(String[] args) {
		
		Voiture audi = new Voiture("Audi" , 130, 1000, 8);
		System.out.println(audi.model + audi.puissance);
		
		System.out.println(audi.essence);
		audi.faireLePlein();
		System.out.println(audi.essence);
		
		Voiture bmw = new Voiture("BMW" , 200, 900, 80);
		Voiture gagnant = audi.collision(bmw);
		if(gagnant==null){
			System.out.println("Aucun gagnant");
		}
		else{
			System.out.println(gagnant);
		}
		
		System.out.print("La voiture ayant le plus d'essence : ");
		if (bmw.essence>audi.essence){
			System.out.println(bmw);
		}
		else{
			System.out.println(audi);
		}
		
	}
	
}
