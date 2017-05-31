import remixlab.proscene.*;
import remixlab.dandelion.core.*;
import remixlab.dandelion.geom.*;
import remixlab.dandelion.constraint.*;
  
Scene scene;
InteractiveFrame frame1, frame2, frame3, frame4;
TerrainCollision terrain;
Ball ball;
PhysicsManager phyManager;
Cannon cannon;
Button btn = new Button();
float maxForce = 100000;

void setup() {
  
  size(1280, 720, P3D);
  scene = new Scene(this);
  scene.eyeFrame().setDamping(0);
  
  phyManager = new PhysicsManager();
  terrain = new TerrainCollision(scene, phyManager.physics);
  ball = new Ball(scene, phyManager.physics);
  
  cannon = new Cannon(scene);  
  
  //frame2 = new InteractiveFrame(scene, loadShape("cannon.obj"));
  
  cannon.frame(0).scale(0.1f);
  cannon.frame(0).setPosition(90,90,-10);
  cannon.frame(0).setRotation(0,0,(-PI/4),2);
}

void draw() {
  background(0);
  fill(204, 102, 0, 150);
  directionalLight(255, 255, 126, 0, -10, -10);
  //scene.drawTorusSolenoid();
  
  
 
  
  
  //pushMatrix();
  //rotateX(-PI/2);
  phyManager.applyPhysics();
  terrain.draw();
  ball.draw();  
  //popMatrix();
  

  scene.drawFrames();
  
  println("rotacion" + cannon.frame(0).rotation().angle());
  
  GUI();
}

void keyPressed() {
  if(scene.eyeFrame().damping() == 0)
    scene.eyeFrame().setDamping(0.5);
  else
    scene.eyeFrame().setDamping(0);
  println("Camera damping friction now is " + scene.eyeFrame().damping());
}

void GUI(){
    scene.beginScreenDrawing();
    pushStyle();
    strokeWeight(8);
    stroke(183,67,158,127);
    noFill();
    arc(50, 55, 50, 50, 0, 2*PI);
    popStyle();
    btn.draw();
    scene.endScreenDrawing();
    
 }
void mousePressed() {
  if (btn.circleOver) {    
    println("lo clikeo");
    double angle =  cannon.frame(2).rotation().angle();
    float hForce =  maxForce * (float)Math.cos(angle);
    float zForce =  maxForce * (float)Math.sin(angle);
    double sigma =  cannon.frame(0).rotation().angle();
    float xForce =  hForce * (float)Math.sin(sigma);
    float yForce =  hForce * (float)Math.cos(sigma);
    ball.fireCan(new Vector3f(-
    xForce, -yForce, zForce));
  }
  if (btn.rectOver) {
    println("el recatacngulo");
  }
}