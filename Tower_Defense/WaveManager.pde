// REMEMBER: every tick
ArrayList<Wave> waves = new ArrayList<Wave>();

class WaveManager {
  void update() {
    for (Wave w : waves) {
      w.run();
    }
  }
}

class Wave {
  void run() {
  }
}

class standartWave01 extends Wave {
  int timeOfLastSpawn = 0;
  int alreadySpawned = 0;
  float delay = 1; //sec delay
  int max = 10;
  standartWave01() {
    waves.add(this);
  }  
  void run() {
    if (millis() - timeOfLastSpawn >= delay*1000 && alreadySpawned < max) {
      Uruk u = new Uruk(width, randomSpawnY());
      u.direction.set(-1, 0);
      timeOfLastSpawn = millis();
      alreadySpawned ++;
    }
  }
}