class Arrow {
    private float Ax, Ay, Aspeed; // Arrow position (x, y) and speed
    private PImage arrow; // Arrow image

    Arrow() {
        Ax = 80; // Initial x-coordinate for the arrow
        Ay = 585; // Initial y-coordinate for the arrow
        Aspeed = 0; // Initial speed (will be set dynamically)
        arrow = loadImage("arrow.png"); // Load the arrow image
        arrow.resize(50, 12); // Resize the arrow image
    }

    void Reload(int i) {
        // Reload the arrow if conditions are met
        if (key == 'r' && remaning_arrow[i - 1] > 0 && Ax >= width) {
            Aspeed = 0; // Reset arrow speed
            Ax = 80; // Reset arrow x-coordinate
            Ay = p.Py + 45; // Set arrow y-coordinate
            flag = true; // Set flag for arrow state
            arrowreleased = false; // Arrow not released
            canShoot = true; // Player can shoot
            flag2 = false; // Reset timing flag
            starttime = 0; // Reset start time
            endtime = 0; // Reset end time
            duration = 0; // Reset duration
            flag3 = true; // Reset flag for initial timing
            flag4=false;
        }
    }

    void DisplayArrow() {
        // Display the arrow image at its current position
        image(arrow, Ax, Ay);
    }

    void update() {
        // Update arrow position based on speed
        Ax += Aspeed;
    }

    void shoot() {
        // Shoot the arrow if conditions are met
        if (key == ' ' && remaning_arrow[0] > 0 && lvl == 1 && !leave && canShoot && start) {
            calcspeed(); // Calculate arrow speed
            arrowreleased = true; // Arrow released
            remaning_arrow[0]--; // Decrease remaining arrows
            canShoot = false; // Player cannot shoot until reloaded
            flag = false; // Reset flag for arrow state
            flag2 = false; // Reset timing flag
            starttime = 0; // Reset start time
            endtime = 0; // Reset end time
            duration = 0; // Reset duration
            crossbow.play(); // Play crossbow sound
        }
        if (key == ' ' && remaning_arrow[1] > 0 && lvl == 2 && !leave && canShoot && start) {
            calcspeed(); // Calculate arrow speed
            arrowreleased = true; // Arrow released
            remaning_arrow[1]--; // Decrease remaining arrows
            canShoot = false; // Player cannot shoot until reloaded
            flag = false; // Reset flag for arrow state
            crossbow.play(); // Play crossbow sound
            flag2 = false; // Reset timing flag
            starttime = 0; // Reset start time
            endtime = 0; // Reset end time
            duration = 0; // Reset duration
        }
    }

    void resetArrow() {
        // Reset arrow properties
        Aspeed = 0; // Reset arrow speed
        Ax = 80; // Reset arrow x-coordinate
        Ay = p.Py + 45; // Set arrow y-coordinate
        flag = true; // Set flag for arrow state
        arrowreleased = false; // Arrow not released
        canShoot = true; // Player can shoot
    }

    void calcspeed() {
        // Calculate arrow speed based on duration
        if (duration < 1000 && duration != 0) {
            Aspeed = 5;
        }
        if (duration >= 1000 && duration < 2000) {
            Aspeed = 10;
        }
        if (duration >= 2000) {
            Aspeed = 15;
        }
    }
}

void keyReleased() {
    // Handle key release events (e.g., shooting)
    if (key == ' '&&!arrowreleased&&flag4) {
      //arrow.Aspeed=5;  
      arrow.shoot();
        flag2 = false;
        
    }
    if (key == 'w' )
        playerup=false;
  if (key == 's' )
        playerdown=false; 
  if(key=='w')
   arrowup=false;
   if(key=='s')
   arrowdown=false;
}

void keyPressed() {
    // Handle key press events (e.g., timing, player movement)
    if (key == ' ' && !arrowreleased&&flag3) {
        if (flag3) {
            starttime = millis();
            flag3 = false;
        }
        flag2 = true;
    }
  if (key == 'w' )
        playerup=true; //  Move player up
  if (key == 's'  )
        playerdown=true; //move player down
  if(key=='w')
   arrowup=true;// Move arrow up
   if(key=='s')
   arrowdown=true;//move arrow down
}
  
