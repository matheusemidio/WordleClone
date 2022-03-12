# Wordle Clone

## Project Description
### Motivation
I decided to develop this application as a personal project because I really enjoyed playing this game and I thought it could be a good and fun learning experience.

### About the application
The idea of the application is to create a clone of the Wordle browser game. Giving a brief explanation, the goal of the game is to guess a random word in a specific amount of guesses. According to the characters of the guess made, the system will give you hints by changing the background color of the chosen letters.
1. Green if that specific character from the guess exists on the word to be discovered and it is in the same position.
2. Yellow if that specific character from the guess exists on the word to be discovered, but it is in the wrong position.
3. Red if that specific character from the guess does not exist on the word to be discovered.

### Technologies used
- Xcode
- Visual Paradigm
I used the Visual Paradigm to draw the flow of behavior from the system and better visualize the existing threads and where is the correct place to call each function.
- Postman
Since on this system I integrated two different restful APIs, I used Postman to facilitate the visualization of the response for the requests made. 

### Timeline
1.	Designed the view.
2.	Started to develop the system and had a clear understanding of the necessary functionalities.
3.	Draw the flow of behavior of the system for a better understanding of the multiple threads. 
4.	Fixed the logic, refactored the code, and mapped explanatory comments for a better understanding of the code.

### Challenges
-	Managing the different threads
I would say that the most challenging part of this project was managing the different threads since I had to make sequential requests for different APIs. The random word API used on this project returns a group of chars that are not real words as well, so it was necessary to check if that word existed in the dictionary before proceeding with the game. Also, every guess from the user has to be a real word in the dictionary. It was necessary to understand the correct place to call each function. In the beginning, it was a bit confusing for me, but after drawing the existing threads carefully I was able to understand and refactor the code. 

### Future features
-	Find the necessary APIs and implement the game in French as well.
-	Refactor the application to Table View or Collection View.
-	Implement a loading screen to show the user while the system calls the APIs.
-	Give the user the option to restart the game.	
	
## Demo

<img src="https://user-images.githubusercontent.com/62715352/158036522-443ebc12-a44d-45fc-9858-f0ff7e2c8102.mov"/>



