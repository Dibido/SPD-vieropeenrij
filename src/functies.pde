int volgendeRuimte(int kolom) {                                                //berekent het volgende vertikale vak voor de schijf
  for (int rij = spelhoogte-1; rij >= 0; rij--)
    if (bord[rij][kolom] == 0) {
      return rij;
    }
  return -1;
}

int geefOpeenrij(int gekozenrij, int gekozenkolom) {                           //geeft het aantal schijven op een rij als er meer dan vier zijn
  int horizontaallinks = 0;                                                    //horizontaal links
  for (int kolom = gekozenkolom-1; kolom >= 0; kolom--) {
    if (bord[gekozenrij][kolom] == bord[gekozenrij][gekozenkolom]) {
      horizontaallinks++;
    } else {
      break;
    }
  }
  int horizontaalrechts = 0;                                                   //horizontaal rechts
  for (int kolom = gekozenkolom; kolom < spelbreedte; kolom++) {
    if (bord[gekozenrij][kolom] == bord[gekozenrij][gekozenkolom]) {
      horizontaalrechts++;
    } else {
      break;
    }
  }
  if (horizontaallinks + horizontaalrechts >= 4) {                             //horizontalen optellen en returnen
    return horizontaallinks + horizontaalrechts;
  }
  int verticaalboven = 0;                                                      //vertikaal boven
  for (int rij = gekozenrij-1; rij >= 0; rij--) {
    if (bord[rij][gekozenkolom] == bord[gekozenrij][gekozenkolom]) {
      verticaalboven++;
    } else {
      break;
    }
  }
  int verticaalonder = 0;                                                      //vertikaal onder
  for (int rij = gekozenrij; rij < spelhoogte; rij++) {
    if (bord[rij][gekozenkolom] == bord[gekozenrij][gekozenkolom]) {
      verticaalonder++;
    } else {
      break;
    }
  }
  if (verticaalonder + verticaalboven >= 4) {                                  //verticalen optellen en returnen
    return verticaalonder + verticaalboven;
  }
  int diagonaallinksboven = 0;                                                 //diagonaal linksboven
  for (int rij = gekozenrij-1, kolom = gekozenkolom-1; rij >= 0 && kolom >= 0; rij--, kolom--) {
    if (bord[rij][kolom] == bord[gekozenrij][gekozenkolom]) {
      diagonaallinksboven++;
    } else {
      break;
    }
  }
  int diagonaalrechtsonder = 0;                                                //diagonaal rechtsonder
  for (int rij = gekozenrij, kolom = gekozenkolom; rij < spelhoogte && kolom < spelbreedte; rij++, kolom++) {
    if (bord[rij][kolom] == bord[gekozenrij][gekozenkolom]) {
      diagonaalrechtsonder++;
    } else {
      break;
    }
  }
  if (diagonaallinksboven + diagonaalrechtsonder >= 4) {                       //diagonaal optellen en returnen
    return diagonaallinksboven + diagonaalrechtsonder;
  }
  int diagonaallinksonder = 0;                                                 //diagonaal linksonder
  for (int rij = gekozenrij+1, kolom = gekozenkolom-1; rij < spelhoogte && kolom >= 0; rij++, kolom--) {
    if (bord[rij][kolom] == bord[gekozenrij][gekozenkolom]) {
      diagonaallinksonder++;
    } else {
      break;
    }
  }
  int diagonaalrechtsboven = 0;                                                //diagonaal rechtsboven
  for (int rij = gekozenrij, kolom = gekozenkolom; rij >= 0 && kolom < spelbreedte; rij--, kolom++) {
    if (bord[rij][kolom] == bord[gekozenrij][gekozenkolom]) {
      diagonaalrechtsboven++;
    } else {
      break;
    }
  }
  if (diagonaallinksonder + diagonaalrechtsboven >= 4) {                       //diagonaal optellen en returnen
    return diagonaallinksonder + diagonaalrechtsboven;
  }
  //default
  return 0;
}

void resetSpel() {                                                             //zet alle waarden terug naar de standaard waarden
  gestart = false;
  isWinnaar = false;
  aantalopeenrij = 0;
  aantalZetten = 0;
  speler = 1;
  for (int speler=0; speler<aantalspelerZetten.length; speler++) {             //leegt het speelveld
    aantalspelerZetten[speler] = 0;
  }
  for (int kolom=0; kolom<spelbreedte; kolom++) {
    for (int rij=0; rij<spelhoogte; rij++) {
      bord[rij][kolom] = 0;
    }
  }
}