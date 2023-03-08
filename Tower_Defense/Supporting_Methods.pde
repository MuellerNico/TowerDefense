// ---------------- DEBUGGING ----------------
void check() {
  System.out.println("Reached Checkpoint");
}
void check(float i) {
  System.out.println("Reached Checkpoint " + i);
}

// ---------------- UPDATING ----------------
void updateProjectiles() {
  for (int i = 0; i < projectiles.size(); i++) {
    projectiles.get(i).update();
  }
}
void updateUnits() {    //calls update for every unit alive
  for (int i = 0; i < units.size(); i++) {
    units.get(i).update();
  }
}
void updateEnemies() {
  for (int i = 0; i < enemies.size(); i++) {
    enemies.get(i).update();
  }
}
void updateParticles(){
  for(int i = 0; i < particles.size(); i++)
    particles.get(i).update();
}
void updateWeapons(){
  for(int i = 0; i<weapons.size(); i++){
    weapons.get(i).update();
  }
}

// ---------------- NUMBERS AND CALCULATIONS ----------------
int randomSpawnY() {
  int r = (int) random(height-50) + 25;
  return r;
}

// ---------------- COLLISION ----------------