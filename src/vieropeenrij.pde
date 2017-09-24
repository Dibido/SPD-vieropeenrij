/*Programma = Vier op een rij
 Naam = Dibran Dokter
 Studentnummer = 587252
 Klas = I1D
 Docent = Rein Harle
 Datum = 3/11/2016 */

int spelhoogte = 7, spelbreedte = 10;                                 //ingestelde bordhoogte en breedte
int speler = 1;                                                       //wie er aan de beurt is
final int MINSPELHOOGTE = 10, MINSPELBREEDTE = 7;                     //minimale hoogte en breedte
final int MAXSPELHOOGTE = 50, MAXSPELBREEDTE = 50;                    //maximale hoogte en breedte
final int INFORUIMTE = 100;                                           //ruimte voor de informatie onder de game
int blokgrootte;                                                      //blokgrootte, schaalt als het spel groter wordt
int breedte = 700, hoogte = 700;                                      //schermgrootte
int[][] bord;                                                         //initieren bord
boolean gestart = false;                                              //of het spel gestart is
int aantalZetten = 0;                                                 //telt de zetten
final int PUNTENPERZET = 50;                                          //de score die men per geplaatsde schijf verliest
int hoogsteScore;                                                     //hoogste haalbare score
final int OPEENRIJSCORE = 100;                                        //toegevoegde score als er meer op een rij word gescoord
String[] spelerNamen = {"Speler 1", "Speler 2" };                     //array voor spelernamen
int[] aantalspelerZetten = new int[spelerNamen.length];               //zetten per speler
boolean isWinnaar = false;                                            //of er gewonnen is
int winnaar;                                                          //wie de winnaar is
int aantalopeenrij;                                                   //hoeveel er op een rij is

void settings() {
  size(breedte, hoogte);
}

void mousePressed() {
  if (gestart == false && mouseX >= width/2-100 && mouseX <= width/2+100 &&           //startknop
    mouseY >= (height/10)*9-50 && mouseY <= (height/10*9+50)) {
    gestart = true;                                                                   //starten game
    bord = new int [spelhoogte] [spelbreedte];                                        //dimensies van het bord instellen
    hoogsteScore = (spelhoogte * spelbreedte) * PUNTENPERZET;                         //berekenen hoogste haalbare score
    if (spelhoogte == spelbreedte || max(spelbreedte, spelhoogte) == spelhoogte) {    //als de hoogte het grootst is of ze gelijk zijn, schalen op de hoogte
      blokgrootte = (hoogte - INFORUIMTE) / (max(spelbreedte, spelhoogte));
    }
    if (max(spelbreedte, spelhoogte) == spelbreedte && spelbreedte != spelhoogte) {   //anders schalen op de breedte
      blokgrootte = breedte / (max(spelbreedte, spelhoogte));
    }
  }
  if (!gestart) {
    if (dist(mouseX, mouseY, width/3, (height/8)*5) < 25) {                             //optie knoppen
      if (spelhoogte > MINSPELHOOGTE) {                                                 //checken niet lager dan de minimum spelhoogte
        spelhoogte--;
      }
    }
    if (dist(mouseX, mouseY, (width/3)*2, (height/8)*5) < 25) {
      if (spelhoogte < MAXSPELHOOGTE) {
        spelhoogte++;
      }
    }
    //min knop kolommen
    if (dist(mouseX, mouseY, (width/3), (height/8)*6) < 25) {
      if (spelbreedte > MINSPELBREEDTE) {
        spelbreedte--;
      }
    }
    //plus knop kolommen
    if (dist(mouseX, mouseY, (width/3)*2, (height/8)*6) < 25) {
      if (spelbreedte < MAXSPELBREEDTE) {
        spelbreedte++;
      }
    }
  }
  if (gestart == true && !isWinnaar) {//game is gestart
    if (mouseY <= spelhoogte * blokgrootte && mouseX <= spelbreedte * blokgrootte) {  //checkt of er binnen het veld is geklikt
      int kolom = mouseX / blokgrootte;                                               //berekenen geklikte kolom
      int rij = volgendeRuimte(kolom);                                                //lege ruimte in kolom opvragen
      if (rij != -1) {                                                                //checken of het niet de laatste is
        bord[rij][kolom] = speler;                                                    //plaatsen schijf
        if (speler == 1) {                                                            //van speler wisselen
          aantalspelerZetten[0]++;
          speler = 2;
        } else if (speler == 2) {
          aantalspelerZetten[1]++;
          speler = 1;
        }
        aantalZetten++;                                                               //zetten tellen
        aantalopeenrij = geefOpeenrij(rij, kolom);                                    //checken winnaar
        if (aantalopeenrij >= 4) {
          winnaar = bord[rij][kolom];                                                 //winnaar zetten
          isWinnaar = true;
        }
      }
    }
  }
}

void draw() {
  if (gestart == false) {                                                             //tekenen startscherm
    tekenStartscherm();
  } 
  if (gestart == true && isWinnaar == false) {                                        //als er nog geen winnaar is, speel het spel
    tekenSpeelScherm();                    
    tekenSpelbord();
  } else if (gestart == true && isWinnaar) {                                          //winnaar is bekend
    tekenScorebord();                                                                //toon scorebord en optie om te herstarten
    if (keyPressed && key==' ')
      resetSpel();                                                                    //spel herstarten
  }
}