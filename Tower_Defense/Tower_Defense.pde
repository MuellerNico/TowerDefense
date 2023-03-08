//BIGGEST TODO: rotation instead of auto-lock, fix melee dmg,  (acceleration for meele units)
// maybe rework entire rotation system
//
boolean friendlyFire = false;
final float defaultCharacterSize = 50;
//final float SCALE_FACTOR = 1;

Unit fred;
Unit steve;
Unit patrick;

void setup() {
  //window
  frameRate(60); 
  fullScreen();
  background(13, 55, 13);
  imageMode(CENTER);

  noStroke();
  fred = new Archer(700, 500);
  patrick = new Archer(700,200);
  steve = new Swordsman(1000, height/2);
  Particle kevin = new Particle(new PVector(width/2, height/2), new PVector(1,1), 0.05, color(255,255,255), 10, 2000);
}

void draw() {
  background(13, 55, 13);  
  fill(255, 255, 255);
  text("FPS: " + frameRate, 25, 25);

  updateProjectiles();
  updateUnits();
  updateEnemies();
  updateParticles();
  updateWeapons();
}

void keyPressed() {
}

void mouseClicked() {
  Uruk u = new Uruk(width, mouseY);
  u.direction.set(-1, 0);
}
