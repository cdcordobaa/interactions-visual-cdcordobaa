import bRigid.*;
import javax.vecmath.Vector3f;

class TerrainCollision{
  Terrain terrain;
  
  BObject rigid;
  BTerrain terrainCol;
  BSphere sphere;  
  BPhysics physics;
  BForce force;
  
  PApplet p;
  
  public TerrainCollision(Scene scene, BPhysics physics){
    
    terrain = new Terrain();    
    p = scene.pApplet();          
    this.physics = physics;
    
    //physics.world.setGravity(new Vector3f(0, 140, 0));
  
    float height = 0.5f;  
    terrainCol = new BTerrain(p, 80, height, 15, new Vector3f(), new Vector3f(2, 2, 2));
    terrainCol.setRotation(new Vector3f(1,0,0) , -PI/2);
    terrainCol.displayShape.setFill(true);
    
    terrainCol.displayShape.setStroke(color(200, 200, 100));
    
    
    
    physics.addBody(terrainCol);
    
    
    rigid = new BBox(p, 5, 2.0f, 1.0f, 1.0f);
    rigid.displayShape.setFill(color(250, 250, 0));
    rigid.displayShape.setStroke(false);
      
    //sphere = new BSphere(p, 2, 20, -20, 10, 20);
    //physics.addBody(sphere);
    //force = new BForce(new Vector3f(0, -5000, 0));
    //force.apply(physics,sphere);
  
  }
  
  void draw(){
    
    //if (frameCount%10==0) {
    //  Vector3f pos = new Vector3f(random(-90, 90), -30, random(-90, 90));
    //  BObject r = new BObject(p, 5, rigid, new Vector3f(50,-30,20), true);
    //  physics.addBody(r);
    //}
    pushMatrix();
    rotateX(-PI/2);
    terrainCol.display();
    popMatrix();
    
    
    //for (int i =1; i<physics.rigidBodies.size()-1; i++) {
    //  BObject b = (BObject) physics.rigidBodies.get(i);
    //  b.display();
    //}
    
  } 
  
}