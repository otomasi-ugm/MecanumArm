PFont gamaSansLight32, gamaSansLight30, gamaSansLight20, gamaSansLight12, gamaSansLight9, gamaSansLight6;
PFont font9, font10, font12, font14, font15, font20;

void font() {
  //uncomment this two line to see font list
  //String[] fontList = PFont.list(); 
  //printArray(fontList);
  gamaSansLight32 = createFont("Gama-Sans-light", 32);
  gamaSansLight30 = createFont("Gama-Sans-light", 30);
  gamaSansLight20 = createFont("Gama-Sans-light", 20);
  gamaSansLight12 = createFont("Gama-Sans-light", 12);
  gamaSansLight9 = createFont("Gama-Sans-light", 9);
  gamaSansLight6 = createFont("Gama-Sans-light", 6);

  font9 = createFont("Arial bold", 9, false);
  font10 = createFont("Arial bold", 10, false);
  font12 = createFont("Arial bold", 12, false);
  font14 = createFont("Arial bold", 14, false);
  font15 = createFont("Arial bold", 15, false);
  font20 = createFont("Arial bold", 20, false);
}
