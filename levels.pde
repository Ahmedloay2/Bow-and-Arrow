 class levels {
    // Constructor (no parameters)
    levels() {
        // Empty constructor (no initialization needed)
    }

    void level1(int i) {
        // Level 1 logic
        if (i == 1 && remaning_redballons[0] > 0 && !leave && start) {
            p.display(i); // Display game elements
            s.move();
             redballon(i); // Handle red balloons
            arrow.update(); // Update arrow position
            explosion(); // Handle balloon explosions
            arrow.Reload(i); // Reload arrow
            s.showtext(i); // Display game information
            score[0] = (remaning_arrow[0] + 1) * (15 - remaning_redballons[0]); // Calculate score
        }
    }

    void level2(int i) {
        // Level 2 logic
        if (remaning_redballons[0] == 0 && !leave && start) {
            lvl = 2; // Set level to 2
            p.display(i); // Display game elements
            s.move();
             yellowballon(); // Handle yellow balloons
            redballon(i); // Handle red balloons
             arrow.update(); // Update arrow position
            explosion(); // Handle balloon explosions
            arrow.Reload(i); // Reload arrow
            s.showtext(i); // Display game information
            score[1] = score[0] + (remaning_arrow[1] + 1) * ((12 - remaning_redballons[1]) + (3 - remaning_yellowballons)); // Calculate score
        }
    }

    void endlevel(int i) {
        // End level logic
        if (remaning_redballons[0] == 0 && remaning_redballons[1] == 0 && remaning_yellowballons == 0 && start) {
            s.end(i); // Display end screen
            leave = false; // Disable gameplay
            text("Congratulations!", (width/2) - 100, height/2);
            text("Your score is " + score[1], (width/2) - 100, (height/2) + 50);
        }
        if ((remaning_arrow[0] == 0 && remaning_redballons[0] != 0) || (remaning_arrow[1] == 0 && (remaning_redballons[1] != 0 || remaning_yellowballons != 0)) && start) {
            if (arrow.Ax > width) {
                s.end(i); // Display end screen
                text("You lost!", (width/2) - 100, height/2);
                text("Try again", (width/2) - 100, (height/2) + 50);
                leave = false; // Disable gameplay
            }
        }
    }

    void starts() {
        s.starts(); // Display start screen
    }

    void reset() {
        arrow.resetArrow(); // Reset arrow properties
        remaning_redballons[0] = 15; // Reset red balloon count
        remaning_redballons[1] = 12; // Reset red balloon count (level 2)
        remaning_arrow[0] = 20; // Reset arrow count
        remaning_arrow[1] = 20; // Reset arrow count (level 2)
        leave = false; // Enable gameplay
        canShoot = true; // Enable shooting
        flag3 = true; // Reset timing flag
        lvl = 1; // Reset level
        remaning_yellowballons = 3; // Reset yellow balloon count
        score[0] = 0; // Reset score
        score[1] = 0; // Reset score (level 2)
        song.jump(0); // Restart background music
        setballons(); // Initialize balloon positions
    }
}
