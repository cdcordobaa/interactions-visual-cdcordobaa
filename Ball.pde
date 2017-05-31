class Ball{
  
 BSphere sphere; 
 BForce force;
 BPhysics physics;
 PApplet p;
 InteractiveFrame frame, ballCamera;
 float radius = 2;
 float mass = 0;
 
 public Ball(Scene scene, BPhysics physics){
   p = scene.pApplet();   
   this.physics = physics;   
   sphere = new BSphere(p, mass, 20, -20, 10, radius);
   this.physics.addBody(sphere);
   
   force = new BForce(new Vector3f(0, 0, 0));
   
   frame = new InteractiveFrame(scene);   
   frame.setPickingPrecision(InteractiveFrame.PickingPrecision.ADAPTIVE);
   frame.setGrabsInputThreshold(scene.radius()/4);
   
   ballCamera = new InteractiveFrame(scene,frame);
   ballCamera.setTranslation(10,-10,0);
   
 }
 
 void draw(){
       
   pushMatrix();
   
   frame.applyTransformation();   

   //scene.drawTorusSolenoid();
    if (frame.grabsInput()){
      
      sphere.setPosition( frame.position().x(),
                          frame.position().y(),
                          frame.position().z());
    }
    else
      refreshPos(sphere.getPosition());
      
    //BObject r = new BObject(p, 5, sphere, framePosToVec() , true);
    //physics.addBody(r);
        
   popMatrix();
 
 }
 
 void refreshPos(Vector3f pos){
   frame.setPosition(new Vec(pos.x, pos.y, pos.z));
   //println(pos.toString());
 }
 
 void onBallView(){
    scene.camera().frame().setWorldMatrix(this.ballCamera);
    scene.camera().lookAt(frame.position());
 }
 
 void addForce(BObject Bobj, Vector3f direction){
      force.setForce(direction);
      force.apply(physics,Bobj);
      print("ya");
    
 }
 
 Vector3f framePosToVec(){
     Vec pos = cannon.frame(2).position();
     return new Vector3f(pos.x() , pos.y(), pos.z());
 }
 
 void fireCan(Vector3f direction){
  BObject r = new BObject(p, 10, sphere, framePosToVec() , true);
  physics.addBody(r);
  addForce(r, direction);
 }
 
 

}