PImage pencilDraw(){
  PImage img = createImage(66, 66, RGB);
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    img.pixels[i] = color(random(0,255), random(0,255), random(0,255)); 
  }
  img.updatePixels();
  return img;
}

PImage pencilDraw2(){
  PImage img = createImage(66, 66, RGB);
  img.loadPixels();
  fill( 100, 1 );
  rect( 0, 0, 500, 500 );
  fill( 21, 234, 179 );
  ellipse( random(0,1000), random(0,1000), 10, 10 );
  img.updatePixels();
  return img;
}
