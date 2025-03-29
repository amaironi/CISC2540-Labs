# CISC2540 Labs
Latest Lab: #4

LAB 4:\
Made a first-person "fighting arena" game.\
Created a "sword" (cylinder placeholder) which the player can swing once per 0.8s. If the player swings it on the enemy, the enemy loses 1 of 5 health points.\
Created an enemy with the same sword. This enemy tries to get close to the player. If it is within striking range, the player has a small window to move out the way or will lose 1 of 5 health points.\
Created a feedback for getting hit, where a red translucent rectangle box will briefly appear upon the player getting hit.\
There is a not-uncommon scenario where both the player and the enemy lose all their health. In which case, the player still gets the death animation, but the text will indicate a draw.
Learned the basics of 3D level designing, how to make an object follow a player (and rotate accordingly), how to animate a node

LAB 3:\
Made a "money grabber" game.\
Created two "bill" scenes, a 25 and 100 bill. Based on RigidBody2D, each has an associated script which makes them disappear upon contact with the player and increase the score (made the score a signal)\
Created a "player" scene, based on CharacterBody2d but removed gravity and jump component from it, so that it can only move left and right (an updated iteration could prevent the sprite from going from out of bounds). This scene has an exported variable for speed for ease of balance\
Created a main scene with multiple instances of the bills and the player. The scene contains two labels: a score tracker and a win check message (which only appears once the win/loss condition stated is met, loss is checked with a timer)\
All sprites self-made in paint.\
Learned how to export a variable, export a signal, label mechanics, interactions with gravity and hitboxes, manipulate the engine's physics


LAB 1:\
Made a "restaurant" scene.\
Created a main scene with two sprites: blue character, stripped "old timey" background\
Created two nested scenes with a sprite each: table and chair, apple\
All sprites (evidently) self-made in paint.\
Learned how to make main and secondary scenes, edit sprites, basic Godot functionalities, make/update GitHub repositories
