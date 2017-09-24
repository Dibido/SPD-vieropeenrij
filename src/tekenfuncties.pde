void tekenStartscherm() {
  rectMode(CORNER);                                             // achtergrond
  fill(80, 105, 175);
  rect(0, 0, breedte, hoogte);
  //spel tekst
  fill(255);
  textSize(30);
  textAlign(CENTER, TOP);
  text("Vier op een rij", width/2, height/10);
  textAlign(CENTER, CENTER);                                    //tekenen informatie
  textSize(13);
  text("Om en om gooit een speler een schijf in een kolom. \n\n Het doel van het spel is om horizontaal, verticaal of diagonaal\n vier schijven van dezelfde kleur op een rij te krijgen.\n\nVoor meer dan 4 op een rij krijgt de winnaar meer punten.", width/2, height/3);
  stroke(10, 35, 105);                                          //teken lijn
  strokeWeight(10);
  line(0, height/2, width, height/2);
  fill(40, 55, 135);                                            //tekenen optie knoppen
  strokeWeight(1);
  ellipseMode(CENTER);
  ellipse(width/3, (height/8)*5, 50, 50);
  ellipse((width/3)*2, (height/8)*5, 50, 50); 
  ellipse((width/3)*2, (height/8)*6, 50, 50);
  ellipse((width/3), (height/8)*6, 50, 50);
  fill(255);                                                    //tekenen lijnen optie tekst
  textSize(20);
  text("Lijnen:", width/2, (height/8)*5-50);
  text(spelhoogte, width/2, (height/8)*5);
  text("Kolommen:", width/2, (height/8)*6-50);                  //tekenen kolommen optie tekst
  text(spelbreedte, width/2, (height/8)*6);
  text("-", width/3, (height/8*5-3));                           //tekenen tekst in knoppen
  text("-", width/3, (height/8*6-3));
  text("+", (width/3)*2, (height/8*5-3));
  text("+", (width/3)*2, (height/8*6-3));
  strokeWeight(5);                                              //tekenen startknop
  rectMode(CENTER);
  rect(width/2, height-50, 200, 100, 50);
  textSize(30);                                                 //tekenen startknop tekst
  fill(0);
  text("START", width/2, height-50);
  strokeWeight(1);
  rectMode(CORNER);
}

void tekenSpelbord() {                                                               //tekent het spelbord
  for (int kolom=0; kolom < spelbreedte; kolom++) {
    for (int rij=0; rij < spelhoogte; rij++) {                                       //tekenen spelraam
      rectMode(CORNER);
      fill(255);
      rect((kolom*blokgrootte), (rij*blokgrootte), blokgrootte, blokgrootte);
      if (bord[rij][kolom] > 0) {
        if (bord[rij][kolom] == 1) {
          fill (255, 0, 0);
        }
        if (bord[rij][kolom] == 2) {
          fill (0, 255, 0);
        }
        ellipseMode(CORNER);
        ellipse(kolom*blokgrootte, rij*blokgrootte, blokgrootte, blokgrootte);       //tekenen cirkels
      }
    }
  }
}

void tekenSpeelScherm() {
  rectMode(CORNER);                                             //tekenen achtergrondkleur
  fill(80, 105, 175);
  rect(0, 0, breedte, hoogte);
  rectMode(CENTER);                                             //tekenen spelerindicatie
  textAlign(CENTER, CENTER);
  fill(255);
  strokeWeight(10);
  if (speler == 1) {                                            //tekenen spelerindicatierand
    stroke(255, 0, 0);
  } else stroke(10, 35, 105);
  rect(breedte/4, hoogte-50, breedte/4, 50, 15);
  if (speler == 2) {
    stroke(255, 0, 0);
  } else stroke(10, 35, 105);
  rect((breedte/4)*3, hoogte-50, breedte/4, 50, 15);
  fill(0);
  textSize(13);
  text(spelerNamen[0]+",", breedte/4-30, hoogte-50);
  text(spelerNamen[1]+",", (breedte/4)*3-30, hoogte-50);
  textAlign(CENTER, CENTER);                                    //tekenen score
  int eindscore = hoogsteScore-(PUNTENPERZET * aantalZetten);
  fill(255);
  text("Score :"+eindscore, width/2, height-50);
  fill(0);
  text("Zetten :"+aantalspelerZetten[0], width/4+40, height-50);
  text("Zetten :"+aantalspelerZetten[1], (width/4)*3+40, height-50);
  //reset
  stroke(0);
  strokeWeight(1);
}

void tekenScorebord() {
  int eindscore = (hoogsteScore-(PUNTENPERZET * aantalZetten)) + (aantalopeenrij * OPEENRIJSCORE); //berekenen eindscore
  fill(80, 105, 175);
  rect(0, 0, breedte, hoogte);
  fill(255);
  textSize(13);
  //tonen winnaar
  text("Winnaar: "+spelerNamen[winnaar-1]+".\n\nMet "+aantalopeenrij+" op een rij!\n\n\n\nDruk op de spatiebalk om overnieuw te spelen.", width/2, height/3);
  textSize(15);
  text("Score = "+eindscore+" punten", width/2, height/2+30);   //tonen eindscore
}