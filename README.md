# Module One Final Project - Ryan Gill & Andrea Williams
  This program is a dog adoption agency that allows the user to search for and adopt dogs in their area.

# To install:
1. Fork and Clone this repository
2. cd to the directory 'json-derulo-dog-adoption'
3. run Bundle Install on the terminal

# To Run:
- To run rspec tests, type 'rspec' in the terminal
- To run the program, type 'ruby bin/run.rb' in the terminal

# To Use:
1. The program will ask you for a name. Valid names can't have any spaces, numbers, or symbols.
2. The program will ask you for a zip code. Your input must be a valid USA zip code.
3. The program will greet you and display a menu. Press Enter to select an option.

  - If you select 'Adopt a new dog', the program will begin the adoption process.
    - The program will ask you a series of questions to narrow down the search for your new pup.
      - For each of these questions, you can make multiple selections (space to select/deselect, enter to finalize).
      - Your search results will only include dogs that match your answer for all of the questions.
    - Once you have answered all of the questions, the program will display the dogs in your zip code that are available to you.
      - You will be able to see the dog's name, age, breed, disability status, temperament, and size.
    - The program will prompt you to select a dog to adopt. Press Enter to select an option.
    - The program will tell you which dog you've just adopted, and return you to the main menu. From there you can adopt another dog, or exit. Each dog may only be adopted once, and won't come up again in any more searches.

  - If you select 'Exit', the program will:
    - Tell you which dogs you've adopted, as well as the time of each adoption.
    - Thank you for using the JSON Derulo Dog Adoption Agency.
    - End.

# LICENSE
  refer to the LICENSE.md file
