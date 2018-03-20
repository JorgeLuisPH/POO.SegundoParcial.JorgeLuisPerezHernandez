import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

sol s;
planeta[] p = new planeta[5];

int pant = 0;

void setup(){
  size (1000, 700);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.setGravity(0,0);
  s = new sol(40,width/2,height/2);
  for (int i = 0; i < p.length; i++) {
    p[i] = new planeta(random(3,6),random(100,350),random(350,550));
  }
}

void draw(){
    background(0);
    fill(255);
    textSize(50);
    text("Solar System Simulator", 250,height/2);
    fill(random(200,255));
    textSize(25);
    text("Press S",800,600);
    switch(key){
      case 's':
      background(0);
      for(int i=0; i<100; i++){
        ellipseMode(CENTER);
        noStroke();
        fill(random(255),random(255),random(255),75);
        ellipse(random(1000),random(700),3,3);
      }
      box2d.step();
      s.display();
      for (int i = 0; i < p.length; i++) {
        Vec2 f = s.at(p[i]);
        Vec2 fo = s.rep(p[i]);
        p[i].applyForce(f);
        p[i].applyForce(fo);
        p[i].display();
      }
      break;
  }
}