void TexturedCube() {
  kinectImage = kinect.getVideoImage();
  textureImage = pencilDraw();
 // kinectImage = pencilDraw();
  beginShape(QUADS);
  texture(kinectImage);
  
  // +Z "front" face
  vertex(-1, -1, 1, 0, 0);
  vertex( 1, -1, 1, 1, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);

  // -Z "back" face
  translate(0, 0, -25);
  vertex( 1, -1, -1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex( 1, 1, -1, 0, 1);
  endShape();


  // +Y "bottom" face
  beginShape(QUADS);
  rotateY(0);
  texture(textureImage);

  //texture(berlinImage);
  translate(0, 0, +20);
  vertex(-1, 1, 10, 0, 0);
  vertex( 1, 1, 10, 1, 0);
  vertex( 1, 1, -100, 1, 1);
  vertex(-1, 1, -100, 0, 1);

  // -Y "top" face
  vertex(-1, -1, -100, 0, 0);
  vertex( 1, -1, -100, 1, 0);
  vertex( 1, -1, 10, 1, 1);
  vertex(-1, -1, 10, 0, 1);
  endShape();

  beginShape(QUADS);
  texture(textureImage);
  // +X "right" face
  vertex( 1, -1, 10, 0, 0);
  vertex( 1, -1, -100, 1, 0);
  vertex( 1, 1, -100, 1, 1);
  vertex( 1, 1, 10, 0, 1);

  // -X "left" face
  vertex(-1, -1, -100, 0, 0);
  vertex(-1, -1, 10, 1, 0);
  vertex(-1, 1, 10, 1, 1);
  vertex(-1, 1, -100, 0, 1);
  endShape();
}

