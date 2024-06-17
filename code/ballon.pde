class ballon {
    private float positionY, speed, radius, acceleration; // Balloon properties
    private float positionX; // Balloon x-coordinate
    private PImage[] ba = new PImage[2]; // Balloon images

    ballon(String co, float x) {
        if (co == "red") {
            acceleration = 0; // No acceleration for red balloons
            speed = 2; // Initial speed for red balloons
            ba[0] = loadImage("ballon.png"); // Load red balloon image
        } else if (co == "yellow") {
            acceleration = 0.0015; // Acceleration for yellow balloons
            speed = 1; // Initial speed for yellow balloons
            ba[1] = loadImage("ballon_yellow.png"); // Load yellow balloon image
        }
        radius = 25; // Balloon radius

        // Set initial position based on x-coordinate
        if (x < width / 2) {
            positionX = width / 2 + x;
            positionY = height; // Start from the top of the screen
        } else {
            positionX = x;
            positionY = random(height, height + 1000); // Random y-coordinate below the screen
        }
    }

    boolean isHit(float arrowX, float arrowY) {
        // Check if arrow hits the balloon
        float d = dist(positionX, positionY+10, arrowX+45, arrowY);
        return d < radius; // Return true if arrow is within the balloon radius
    }

    void showballon(String co) {
        // Display the appropriate balloon image
        if (co == "red") {
            image(ba[0], positionX, positionY, 50, 50);
        } else if (co == "yellow") {
            image(ba[1], positionX, positionY, 50, 50);
        }
    }

    void update(int i) {
        // Update balloon position and speed
        if (positionY - 25 < 100 && i == 1) {
            positionY = height; // Reset position when reaching the top
        }
        if (i == 2 && positionY - 25 < 100) {
            positionY = height; // Reset position for level 2 balloons
            positionX = random(width / 2, width - 30); // Randomize x-coordinate
        }
        positionY = positionY - speed; // Move the balloon up
        speed = speed + acceleration; // Increase speed over time
    }
}
