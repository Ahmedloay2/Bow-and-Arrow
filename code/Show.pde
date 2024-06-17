class show {
    // Constructor (no parameters)
    show() {
        // Empty constructor (no initialization needed)
    }

    void showtext(int i) {
        // Display game information (remaining arrows, remaining red balloons, score, level)
        fill(155);
        rect(0, 0, width, 100); // Draw a rectangle for the information display
        stroke(0); // Set stroke color
        textSize(30); // Set text size
        fill(0); // Set text color
        text("Remaining Arrows: " + remaning_arrow[i-1], 20, 40); // Display remaining arrows
        text("Remaining red balloons: " + remaning_redballons[i-1], 300, 40); // Display remaining red balloons
        text("Score: " + score[i-1], 20, 90); // Display player's score
        text("Level: " + lvl, 700, 65); // Display current level
        if (i == 2) {
            text("Remaining yellow balloons: " + remaning_yellowballons, 300, 90); // Display remaining yellow balloons (level 2)
        }
    }

    void end(int i) {
        // Display end screen with options to play again or exit
        
        background(p.BG[i-1]); // Set background based on level
        image(p.player[2], 50, p.Py); // Display player image
        fill(155); // Set fill color
        rect(width/2 - 100, height/2 + 125, 150, 50); // Draw "Play again" button
        rect(width/2 + 100, height/2 + 125, 100, 50); // Draw "Exit" button
        rect((width/2) - 125, height/2 - 25, 250, 100); // Draw a rectangle for the end screen
        textSize(30); // Set text size
        fill(0); // Set text color
        text("Play again", (width/2) - 100, (height/2) + 150); // Display "Play again" text
        text("Exit", (width/2) + 125, (height/2) + 150); // Display "Exit" text
        if (mouseButton == LEFT) {
            if (mouseY >= height/2 + 125 && mouseY <= height/2 + 175) {
                if (mouseX >= width/2 - 100 && mouseX <= width/2 + 50) {
                    level.reset(); // Reset the game
                    redraw(); // Redraw the canvas
                }
                if (mouseX >= width/2 + 100 && mouseX <= width/2 + 200) {
                    exit(); // Exit the program
                }
            }
        }
    }

    void starts() {
        // Display start screen with a "Start" button
        if (!start) {
           background(255); // Set the background to white
            tint(255, 127); // Apply tint with 50% transparency
            image(p.BG[0], 0, 0); // Draw the image over the background
            noTint();
            fill(0); // Set fill color
            rect(width/2 - 50, height/2 - 50, 125, 75, 50); // Draw "Start" button
            textSize(30); // Set text size
            fill(255); // Set text color
            text("Start", width/2 - 25, height/2 - 5); // Display "Start" text
            if (mouseButton == LEFT) {
                if (mouseX >= width/2 - 50 && mouseX <= width/2 + 100) {
                    if (mouseY >= height/2 - 50 && mouseY <= height/2 + 25) {
                        start = true; // Start the game
                    }
                }
            }
        }
    }

void move(){
 if(playerup&& !leave && p.Py > 100)
 p.Py-=8;// Move player up
 if(playerdown && !leave && p.Py < height-110)
 p.Py+=8;//move player down
 if(arrowup&&!arrowreleased&&!leave&&arrow.Ay>100+45)
 arrow.Ay-=8;// Move arrow up
 if(arrowdown&&!arrowreleased&&!leave&&arrow.Ay<height+45-110)
 arrow.Ay+=8;//move arrow down
}
}
