
class PhysicsManager{
  
  BPhysics physics;
  
  public PhysicsManager(){
    physics = new BPhysics();
    physics.world.setGravity(new Vector3f(0, 0, -90));
  
  }
  
  void applyPhysics(){

    physics.update();  
    
    for (int i =1; i<physics.rigidBodies.size(); i++) {
      BObject b = (BObject) physics.rigidBodies.get(i);
      b.display();
    }
    
  }

}