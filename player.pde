class Player {
    float Px, Py; // Player position (x, y)
    private PImage[] player = new PImage[3]; // Array of player images
    private PImage[] BG = new PImage[2]; // Background images

    Player() {
        // Load player and background images
        player[0] = loadImage("stand.png");
        player[1] = loadImage("armed.png");
        player[2] = loadImage("wo_arrow.png");
        BG[0] = loadImage("background1.jpg");
        BG[1] = loadImage("background2.jpg");
        BG[1].resize(1920,1080);  
        Py = 540; // Initial y-coordinate for the player
        Px = 40; // Initial x-coordinate for the player
    }

    void display(int i) {
        background(BG[i - 1]); // Set background based on index (1 or 2)

        if (flag) {
            arrow.DisplayArrow(); // Display arrow (assuming arrow-related logic elsewhere)
            canShoot = true; // Set canShoot flag
            image(player[0], Px, Py); // Display standing player image
        }

        if (!arrowreleased&&flag2) {
            background(BG[i - 1]);
            arrow.DisplayArrow();
            image(player[1], Px, Py); // Display armed player image
        }

        if (!flag) {
            background(BG[i - 1]);
            arrow.DisplayArrow();
            image(player[2], Px, Py); // Display player without arrow image
        }

        strength(); // Call the strength method
    }

    void strength() {
        if (flag2) {
            endtime = millis();
            duration = endtime - starttime;

            if (duration < 1000 && duration > 0) {
                fill(255, 0, 0); // Red color
                rect(40, Py + 110, 30, 20); // Display strength bar (short duration)
            }

            if (duration >= 1000 && duration < 2000) {
                fill(0, 255, 0); // Green color
                rect(40, Py + 110, 60, 20); // Display strength bar (medium duration)
            }

            if (duration >= 2000) {
                fill(0, 0, 255); // Blue color
                rect(40, Py + 110, 100, 20); // Display strength bar (long duration)
            }
            flag4=true;
        }
    }
}
