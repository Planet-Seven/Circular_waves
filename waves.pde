/**********************************************************************************
 * (C) 2024 Vojtech Svoboda @ TU/e and CTU, as part of Creative Programming DBB100
 * 
 * This program simulates the propagation of circular waves within a visual medium.
 * The implementation renders a grid of circles to represent the medium, with waves 
 * visualized by altering the diameter of these circles. Through this simulation, 
 * various wave interactions, including constructive and destructive interference,
 * can be explored.
 * 
 * To generate a wave, the user simply clicks the left mouse button anywhere on the 
 * screen.
 * 
 * The simulation leverages a combination of simple analytic geometry and trigonometric
 * functions to simulate wave behavior. Each wave is represented as a concentric 
 * circle expanding outward from its source, with parameters such as speed, amplitude,
 * and dissipation factor influencing its propagation and impact.
 * 
 * Notable effects can be observed by adjusting the constants within the code. For 
 * instance, modifying the amplitude can create visually striking effects where circles
 * overflow their neighboring positions, resulting in a dynamic and playful aesthetic.
 * 
 * This simulation invites users to explore the fascinating dynamics of circular waves
 * and serves as a platform for experimentation and artistic expression.
 *
 * Generative AI was used to draft some parts of the documentation, but NOT the code.
 *
 * Works with Processing 4.3
 *********************************************************************************/

//used for image capture
import processing.svg.*;
import processing.pdf.*;
boolean record;

//constants to alter the properties of the waves
final float speed = 5; //speed of propagation
final float maxRadius = 5000; //radius at which a wave gets deleted
final int offset = 30; //offset of individual points
final int wavelength = 500; //wavelength in pixels
final int waveCount = 8; //amount of periods before propagation stops
final int initialRadius = 0; //initial radius of the fixed circles
final int amplitude = 300; //amplitude of a wave
final float dissipationFactor = 2; //Rate at which the wave dissipates. The closer the number is to zero, the stronger the dissipation. 2 for a realistic wave simulation.

final color bgColor = #040910;
final color circleColor = #DE16D4;
final color outlineColor = #040910;

ArrayList<Wave> waves = new ArrayList<Wave>();

//formula for the distance between a point and a circumference 
float getPointCircDist( int xPoint, int yPoint, float xCirc, float yCirc, float radius)
{
  return sqrt( pow(xPoint - xCirc, 2) + pow(yPoint - yCirc, 2 )) - radius;
}

//calculate the radius of a specified circle
float getRadius( int x, int y, Wave wave )
{
  return (  
    amplitude *
    //change the period of the sin function to correspond to the wavelength
    //add pi to the argument to make sure the wave starts with a crest, not a trough.
    sin( getPointCircDist( x, y, wave.x, wave.y, wave.radius) / wavelength * 2*PI + PI)
    //dissipation of the wave
    / pow( wave.radius, 1/dissipationFactor)
   );
}

void drawCircle(int x, int y)
{
  float radius = initialRadius;
  
  //the enhanced loop syntax can be used here because we don't alter the waves
  for (Wave wave: waves)
  {
    //check if the point is inside the circumference and close enough to the first crest.
    if ( dist(x, y, wave.x, wave.y) <= wave.radius && dist(x, y, wave.x, wave.y) >= wave.radius - waveCount * wavelength)
    {
      radius += getRadius(x, y, wave);
    }
  }
  //prevent negative radius
  if (radius < 0) radius = 0;
  circle(x, y, radius); 
}

void mouseClicked()
{
  waves.add(new Wave( mouseX, mouseY ));
}

//image capture
void keyPressed()
{
  if (key == 'q')
  {
    record = true; 
  }
}

void setup() 
{
  fullScreen();
  background(bgColor);
  fill(circleColor);
  stroke(outlineColor);
}

void draw()
{
  //image capture
  if (record) beginRecord(PDF, "waves.pdf"); 
  background(bgColor);
  for (int i = 0; i <= waves.size() -1 ; i++ )
  {
    Wave wave = waves.get(i);
    wave.update();
    
    if (wave.radius > maxRadius)
      waves.remove(i);
  }

  for (int i = offset; i <= displayWidth - offset; i += offset)
  {
    for (int j = offset; j <= displayHeight - offset; j += offset)
    {
      drawCircle(i, j);
    }
  }
 
  //image capture
  if (record)
  {
    endRecord();
    record = false;
  }
}

class Wave
{
  //coordinates of the source of the wave
  float x;
  float y; 
  //radius, gets larger every re-render
  float radius;
  
  Wave ( float tempX, float tempY )
  {
    x = tempX;
    y = tempY;
    radius = 0;
  }

  void update()
  {
    radius += speed; 
  }
}
