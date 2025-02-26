# CISC2540 Labs
Latest Lab: #3

LAB 3:\
Made a "money grabber" game.\
Created two "bill" scenes, a 25 and 100 bill. Based on RigidBody2D, each has an associated script which makes them disappear upon contact with the player and increase the score (made the score a signal)\
Created a "player" scene, based on CharacterBody2d but removed gravity and jump component from it, so that it can only move left and right (an updated iteration could prevent the sprite from going from out of bounds). This scene has an exported variable for speed for ease of balance\
Created a main scene with multiple instances of the bills and the player. The scene contains two labels: a score tracker and a win message (which only appears once the win condition stated is met)\
All sprites self-made in paint.\
Learned how to export a variable, export a signal, interactions with gravity and hitboxes, manipulate the engine physics


LAB 1:\
Made a "restaurant" scene.\
Created a main scene with two sprites: blue character, stripped "old timey" background\
Created two nested scenes with a sprite each: table and chair, apple\
All sprites (evidently) self-made in paint.\
Learned how to make main and secondary scenes, edit sprites, basic Godot functionalities, make/update GitHub repositories
