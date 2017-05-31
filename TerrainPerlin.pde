
public class Terrain{
  int cols, rows;
  int scl = 1;
  int w = 100;
  int h = 50;
  float[][] terrainElevation;
  PShape terrain;
  
  Terrain(){ 
    cols = w / scl;
    rows = h/ scl;
    terrainElevation = new float[cols][rows];
    
    terrain = createShape();  
    calculatePerlinNoise();
    buildTerrainShape();
  }
  void draw(){
    
    shape(terrain);
    
  }
  
  void calculatePerlinNoise() {
    
    float yoff = 0;
    for (int y = 0; y < rows; y++) {
      float xoff = 0;
      for (int x = 0; x < cols; x++) {
        terrainElevation[x][y] = map(noise(xoff, yoff), 0, 1, -15, 15);
        xoff += 0.08;
      }
      yoff += 0.08;
    }
  }
  
  void buildTerrainShape() {
      
      for (int y = 0; y < rows-1; y++) {
      terrain.beginShape(TRIANGLES);
      for (int x = 0; x < cols-1; x++) {
        
        terrain.vertex(x*scl, y*scl, terrainElevation[x][y]);
        terrain.vertex(x*scl, (y+1)*scl, terrainElevation[x][y+1]);
        terrain.vertex((x+1)*scl, y*scl, terrainElevation[x+1][y]);
        
        terrain.vertex(x*scl, (y+1)*scl, terrainElevation[x][y+1]);
        terrain.vertex((x+1)*scl, y*scl, terrainElevation[x+1][y]);
        terrain.vertex((x+1)*scl, (y+1)*scl, terrainElevation[x+1][y+1]);
  
      }
      
       terrain.fill(200);
       //myTerrain.noFill();
       terrain.stroke(255,255,255);     
       terrain.endShape();   
    }    
  }
  
}