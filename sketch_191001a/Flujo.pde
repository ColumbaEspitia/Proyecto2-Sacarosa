class ParticleSystem{
  ArrayList<Box> box;
  PVector origin;
  ParticleSystem(int num, PVector v){
    box = new ArrayList<Box>();
    origin = v.get();
    
    for(int i = 0; i < num; i++){
      box.add(new Box(origin.x, origin.y));
    }
  }
  
  void run() {
    for (Box p: box) {
      p.display();
    }

    for (int i = box.size()-1; i >= 0; i--) {
      Box p = box.get(i);
      if (p.done()) {
        box.remove(i);
      }
    }
  }

  void addParticles(int n) {
    for (int i = 0; i < n; i++) {
      box.add(new Box(origin.x,origin.y));
    }
  }

  boolean dead() {
    if (box.isEmpty()) {
      return true;
    } 
    else {
      return false;
    }
  }
}
