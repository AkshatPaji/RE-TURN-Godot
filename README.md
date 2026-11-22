# RE:TURN - Godot

#### Hola amigos, well I dont know how many of you have played my original game [RE:TURN](https://akshatpaji.itch.io/return) made during Haven@Chandigarh, goated event. anyways i tried recreating the same in godot(original made using pygame) but i failed, still need to learn alot of things in godot

## How to play

- Move the paddle with the **Up** and **Down** arrow keys.
- Hit the ball with the paddle. The bounce angle changes depending on where the ball hits.
- Score points by hitting the barrier on the right.
- The game ends if the ball gets past the paddle. Select **Restart** to play again.

## Features

- Paddle angle changes with its position and movement.
- Ball speed varies slightly after collisions and stays between 440 and 600.
- High score is saved between sessions in Godot's `user://high_score.cfg` file.

## Run the game

1. duplicate the project .zip file from github
2. Open the project in Godot4 and press **F5** to run the game.

1. Simply log onto [Itch.io : return-godot](https://akshatpaji.itch.io/return-godot) and run the game directly on the web

## Screenshot
<img width="1600" height="900" alt="image" src="https://github.com/user-attachments/assets/9fcf04b4-2ccd-4e9e-8ce1-46c1c8d30180" />

## AI Usage
#### I have used AI (Copilot and Codex) to help me debug and as this is my first Godot project it also helped me with the vast number of features and exporting. Rest i relied on documentaions and other games or tutorials on youtube for help (majority).

## Project structure

- `Scenes/` contains the game, ball, paddle, barrier, and HUD scenes.
- `Scripts/` contains the ball and paddle movement scripts.
- `Assets/` contains the table, racket, and ball artwork.

## Assets
Logo - [Canva Template](https://www.canva.com/templates/EAGAuX8UNPQ/)
Table, Racket & Ball - Custom Made using Inspiration from internet and my own table tennis equipment 
