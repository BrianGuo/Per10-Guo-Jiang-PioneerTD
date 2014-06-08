ArrayList<Tower> Towers = new ArrayList<Tower>();
int count = 0;

void DrawGuns() {
  for(int i = 0; i < count; i++ ) {
      Tower t = Towers.get(i);
      image(t.getBuoy(),t.getXcor(),t.getYcor());
      image(t.getGun(), t.getXcor(), t.getYcor());
  }
}
  
void addTower(PImage b, PImage g,PImage p, float x, float y) {
  count ++;
  Tower t = new Tower();
  t.setYcor(y);
  t.setXcor(x);
  t.setGun(g);
  t.setBuoy(b);
  t.setProjectile(p);
  Towers.add(t);
}

void remove(Tower t) {
  Towers.remove(t);
  count --;
}

void fire() {
  for (int i = 0; i < count; i++) {
    Tower t = Towers.get(i);
    image(t.getProjectile() ,t.getXcor(),t.getYcor()-10);
  }
}
