// Import the necessary sound libraries
import processing.sound.*; 

// Initialize variables for timing, flags, and game state
float starttime = 0, endtime = 0, duration = 0;
boolean flag = true, arrowreleased = false, leave = false, start = false, canShoot = true, flag2, flag3 = true,flag4=false;
boolean arrowup,arrowdown,playerup,playerdown;
// Create ArrayLists to store red and yellow balloons
ArrayList<ballon>[] br = new ArrayList[2];
ArrayList<ballon> by = new ArrayList<ballon>();

// Create an ArrayList to store particle effects
ArrayList<Particle> particles = new ArrayList<>();

// Initialize arrays for remaining red balloons, remaining arrows, and scores
int[] remaning_redballons = {15, 12}, remaning_arrow = {20, 25}, score = new int[2];

// Initialize level, remaining yellow balloons, and arrow properties
int lvl = 1, remaning_yellowballons = 3;
Arrow arrow;
Player p;
levels level;
show s;

// Load sound files for background music, balloon pop, and crossbow
SoundFile song, crossbow, ballon_pop;

void setup() {
    size(1920, 1080);
    arrow = new Arrow();
    p = new Player();
    s = new show();
    level = new levels();
    song = new SoundFile(this, "music.mp3");
    ballon_pop = new SoundFile(this, "ballon pop.mp3"); 
    crossbow = new SoundFile(this, "crossbow.mp3");
    song.play();
    setballons();
    fullScreen();
}

void draw() {
    level.starts();
    level.level1(lvl);
    level.level2(lvl);
    level.endlevel(lvl);
}

// Handles the explosion effect for particles
void explosion() {
    for (int i = particles.size() - 1; i >= 0; i--) {
        Particle p = particles.get(i);
        p.update();
        p.display();
        if (p.isDead()) {
            particles.remove(i);
        }
    }
}

// Handles red balloons
void redballon(int j) {
    for (int i = br[j - 1].size() - 1; i >= 0; i--) {
        br[j - 1].get(i).showballon("red");
        br[j - 1].get(i).update(lvl);
        if (br[j - 1].get(i).isHit(arrow.Ax, arrow.Ay)) {
            br[j - 1].remove(i);
            remaning_redballons[j - 1]--;
            addParticles();
            ballon_pop.play();
        }
    }
}

// Adds particles to the explosion effect
void addParticles() {
    for (int j = 0; j < 15; j++) {
        Particle p = new Particle(arrow.Ax, arrow.Ay);
        particles.add(p);
    }
}

// Handles yellow balloons
void yellowballon() {
    for (int i = by.size() - 1; i >= 0; i--) {
        by.get(i).showballon("yellow");
        by.get(i).update(lvl);
        if (by.get(i).isHit(arrow.Ax, arrow.Ay)) {
            by.remove(i);
            remaning_yellowballons--;
            addParticles();
            ballon_pop.play();
        }
    }
}

// Initializes balloon positions
void setballons() {
    for (int j = 0; j < br.length; j++) {
        br[j] = new ArrayList<>(); 
        for (int i = 0; i < remaning_redballons[j]; i++) {
            if (j == 0)
                br[j].add(new ballon("red", i * 60));
            else
                br[j].add(new ballon("red", random(width/2, width-30)));
        }
    }
    for (int i = 0; i < remaning_yellowballons; i++) {
        by.add(new ballon("yellow", random(width/2, width-30)));
    }
}

  
