class Particle {
 private  float x, y; // Particle position
 private  float vx, vy; // Particle velocity
 private float lifespan; // Remaining lifespan
  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    this.vx = random(-2, 2); // Random initial velocity
    this.vy = random(-2, 2);
    this.lifespan = 255; // Initial lifespan
  }
void update() {
    x += vx;
    y += vy;
    lifespan -= 2; // Decrease lifespan over time
  }
void display() {
    noStroke();
    fill(255,lifespan); // Fade out over time
    ellipse(x, y, 10, 10); // Particle shape
  }
boolean isDead() {
    return lifespan <= 0;
  }
}
