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
    private var numberOfRounds  : Int = 0
    
    private func askNumberOfPlayer(){
        print("How many players will play ?")
        self.numberOfPlayers = inputManager.inputInt()
        print("")
    }
    
    private func printPlayers(exception : Player){
        for player in players {
            if player.playerID != exception.playerID {
                 print(player.playerID)
            }
        }
    }
    private func initializePlayers(){
        for i in 1...numberOfPlayers{
            let player = Player(playerID: i)
            players.append(player)
        }
    }
    
    private func initializeCharacters(){
        for player in players {
            player.addCharacter(nameArray: &self.nameArray)
        }
    }
    
    private func removePlayer(playerID : Int){
        if players[playerID].team.count == 0 {
            players.remove(at: playerID)
        }
    }
    
    private func mainLoop(){
        // While there is more than one player with caracters alive we continue our loop
        while(players.count > 1){
            
            // For each players we must show the same menu
            for player in players{
                var playerAction : Int = 0
                
                print("----------------------Player \(player.playerID) turn's----------------------\n")
                print("RECAP OF THE TEAM")
                player.detailTeam()
                print("")
                
                print("What do you want to do ?")
                print("1: Attack")
                print("2: Heal")
                print("")
                
                playerAction = inputManager.inputInt()
                switch playerAction {
                case 1:
                    print("Choose a character to attack")
                    player.printName()
                    
                    if player.characterCanPlay(teamArray: player.team) {
                        print("On est dans la boucle pour attaquer")
                        
                        var attackedPlayer : Int = 0
                        
                        repeat{
                            print("Choose the ennemy team you want to fight")
                            self.printPlayers(exception: player)
                            
                            attackedPlayer = inputManager.inputInt()
                        }while(attackedPlayer !in [0...numberOfPlayers])
                    
                    }
                    
                default:
                    fatalError()
                } // Fin du switch de player Action
                
                
                
                
            } //Fin boucle for principale
            
        } //Fin boucle while principale
        
    } // Fin de la fonction
    
    public func start(){
        self.askNumberOfPlayer()
        self.initializePlayers()
        self.initializeCharacters()
    }
    
    
    
}
