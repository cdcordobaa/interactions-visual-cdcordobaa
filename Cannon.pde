
class Cannon{
  
  Scene scene;
  InteractiveFrame [] frameArray;
  
  public Cannon(Scene s){  
    scene =  s;
    frameArray = new InteractiveFrame[3];

    frameArray[0] = new InteractiveFrame(scene, loadShape("disc.obj"));
  
    
    frameArray[1] = new InteractiveFrame(scene, frameArray[0] ,  loadShape("base.obj"));
    
    
    
    frameArray[2] = new InteractiveFrame(scene, frameArray[1] , loadShape("cannonLast.obj"));
    frame(2).setTranslation(0,-18.5,68.46);
    
    
    WorldConstraint baseConstraint = new WorldConstraint();
    baseConstraint.setTranslationConstraint(AxisPlaneConstraint.Type.PLANE, new Vec(0.0f, 0.0f, 1.0f));
    baseConstraint.setRotationConstraint(AxisPlaneConstraint.Type.AXIS, new Vec(0.0f, 0.0f, 1.0f));
    frame(0).setConstraint(baseConstraint);
    
    
    LocalConstraint desplacement = new LocalConstraint();
    desplacement.setTranslationConstraint(AxisPlaneConstraint.Type.AXIS , new Vec(0.0f, 1.0f, 0.0f));
    desplacement.setRotationConstraint   (AxisPlaneConstraint.Type.FORBIDDEN, new Vec(1.0f, 0.0f, 0.0f));    
    frame(1).setConstraint(desplacement);
    
    
    
    LocalConstraint XAxis = new LocalConstraint();
    XAxis.setTranslationConstraint(AxisPlaneConstraint.Type.FORBIDDEN, new Vec(0.0f, 0.0f, 0.0f));
    XAxis.setRotationConstraint   (AxisPlaneConstraint.Type.AXIS, new Vec(1.0f, 0.0f, 0.0f));    
    frame(2).setConstraint(XAxis);
    

  }  
  
  public InteractiveFrame frame(int i) {
    return frameArray[i];
  }
}