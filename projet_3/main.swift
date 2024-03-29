//
//  main.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

var numberOfPlayers: Int = 0
var numberOfCharacters: Int = 0

numberOfPlayers = InputManager.shared.askInt(descriptionParameters: ["Numbers of players", "Choose a number between 2 and 4"], choiceParameters: nil, wrongDescription: ["Error, you chose a invalid number", "Enter a valid number between 2 and 4"], valueAccepted: [2, 3, 4])

numberOfCharacters = InputManager.shared.askInt(descriptionParameters: ["Numbers of characters per team", "Choose a number between 1 and 6"], choiceParameters: nil, wrongDescription: ["Error, you chose a invalid number", "Enter a valid number between 1 and 6"], valueAccepted: [1, 2, 3, 4, 5, 6])

var game: Game = Game(numberOfPlayers: numberOfPlayers, numberOfCharacters: numberOfCharacters)

game.start()
