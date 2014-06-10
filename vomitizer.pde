import SimpleOculusRift.*;
import org.openkinect.*;
import org.openkinect.processing.*;

SimpleOculusRift   oculusRiftDev;
Kinect kinect;

/* KINECT */
boolean rgb = true;
float[] depthLookUp = new float[2048];
int w = 640;
int h = 480;

boolean   fullScreen = false;
float floorDist = 1.7;
float walkValue = -3.5;

float lar = 600;
float cor = 0;

PImage kinectImage;
PImage textureImage;
PImage textureImage2;
PImage texture;
PImage texture2;

void setup()
{
  if (fullScreen)
    size(1920, 1200, OPENGL);
  else    
    size(1280, 800, OPENGL);
  println("OPENGL_VERSION: " + PGraphicsOpenGL.OPENGL_VERSION);
  println("GLSL_VERSION: " + PGraphicsOpenGL.GLSL_VERSION);

  oculusRiftDev = new SimpleOculusRift(this, SimpleOculusRift.RenderQuality_Middle); 
  oculusRiftDev.setBknColor(10, 13, 2);  // just not total black, to see the barrel distortion
  
  /* KINECT   */

   kinect = new Kinect(this);
  kinect.start();
  kinect.enableRGB(true);
  kinect.enableDepth(true);
  kinect.processDepthImage(false);
  strokeWeight(0.5);
  texture2 = createImage(66, 66, RGB);
  texture2 = createImage(66, 66, RGB);
  
}

void draw()
{
  PVector orientation = oculusRiftDev.sensorOrientation();
  textureMode(NORMAL); 
  oculusRiftDev.draw();
} 

void onDrawScene(int eye)
{  
  stroke(200, 200, 220);
  fill(100, 100, 220);

  // rot box
  pushMatrix();
  translate(0, 0, walkValue);
  //rotateY(radians(mouseX));
  //rotateX(radians(mouseY));
  
  TexturedCube();
  popMatrix();
}

boolean sketchFullScreen() 
{
  return fullScreen;
}     

void keyPressed()
{
  if (key == CODED) {
    if (keyCode == UP) {
      println("UP");
      walkValue = walkValue+1;
    } else if (keyCode == DOWN) {
      println("DOWN");
      walkValue = walkValue-1;
    } 
  } else {
    println("reset head orientation");
    oculusRiftDev.resetOrientation();
  }
}

