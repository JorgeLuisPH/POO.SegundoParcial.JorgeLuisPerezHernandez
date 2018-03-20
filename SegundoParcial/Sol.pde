class sol{
  Body body;
  float r;
  
  sol(float r_, float x, float y){
    r = r_;
    BodyDef bd = new BodyDef();
    bd.type = BodyType.STATIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    body.createFixture(cs,1);

  }
  
  Vec2 at(planeta p) {
    float g = 150; 
    Vec2 pos = body.getWorldCenter();    
    Vec2 mp = p.body.getWorldCenter();
    Vec2 f = pos.sub(mp);
    float d = f.length();
    d = constrain(d,1,5);
    f.normalize();
    float s = (g * 1 * p.body.m_mass) / (d * d);
    f.mulLocal(s);
    return f;
  }
  Vec2 rep(planeta p) {
    float g = -100; 
    Vec2 pos = body.getWorldCenter();    
    Vec2 mp = p.body.getWorldCenter();
    Vec2 f = pos.sub(mp);
    float d = f.length();
    d = constrain(d,1,5);
    f.normalize();
    float s = (g * 1 * p.body.m_mass) / (d * d);
    f.mulLocal(s);
    return f;
  }
  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float angulo = body.getAngle();
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(angulo);
    fill(random(190,250), random(180,232), random(86,96));
    noStroke();
    ellipse(0,0,r*2,r*2);
    popMatrix();
  }
  
}