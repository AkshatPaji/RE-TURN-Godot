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

1. Simply log onto [Itch.io : return-godot](linktobeadded) and run the game directly on the web

## Project structure

- `Scenes/` contains the game, ball, paddle, barrier, and HUD scenes.
- `Scripts/` contains the ball and paddle movement scripts.
- `Assets/` contains the table, racket, and ball artwork.