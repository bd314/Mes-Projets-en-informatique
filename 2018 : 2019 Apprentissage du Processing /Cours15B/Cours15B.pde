// Cours 15BIs
String[] sNotes;
int[] distrib= new int[21];
int moyennetemp, moyenne;

void setup() {
  size(600, 600);
  
}

void draw() {
  distrib= new int[21];
  background(122);
  sNotes = loadStrings("notes.txt");

  int[] notes = int(sNotes);
  moyennetemp = 0;
  for (int i=0; i< notes.length; i++) {

    moyennetemp += notes[i];
    distrib[int(notes[i])]+=1;
  }

  stroke(255, 0, 0);
  moyenne = moyennetemp / notes.length;
  println(distrib[1]);
  line(0, height-(height/21)*moyenne, width, height-(height/21)*moyenne);
  
}
