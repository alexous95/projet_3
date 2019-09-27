//
//  Game.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 26/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

class Game {
    
    private var inputManager = InputManager()
    
    private var players   : [Player] = []
    public var nameArray  : [String] = []
    
    private var numberOfPlayers : Int = 0
    
    private func askNumberOfPlayer(){
        print("How many players will play ?")
        self.numberOfPlayers = inputManager.inputInt()
        print("")
    }
    
    private func initializePlayers(){
        for i in 1...numberOfPlayers{
            let player = Player(playerID: i)
            players.append(player)
        }
    }
    
    
    
}
