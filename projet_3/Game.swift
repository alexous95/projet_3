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
        print("Choose a number between 1 and 4")
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
        var loop : Bool = true
        while(loop){
            
            // For each players we must show the same menu
            for player in players{
                if loop == false {
                    continue
                }
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
                    
                // Case where the player attacks another player
                case 1:
                    print("Choose a character to attack")
                    player.printName()
                    print("")
                    //Get the player from the team who is going to attack
                    let choosenPlayer = player.characterCanPlay(teamArray: player.team)
                    let indexChoosenAttacker = player.indexCharacter(chara: choosenPlayer!)
                    
                    if choosenPlayer != nil {
                        var attackedPlayer : Int = -1
                        
                        repeat{
                            print("Choose the ennemy team you want to fight")
                            self.printPlayers(exception: player)
                            
                            attackedPlayer = inputManager.inputInt()
                            print("")
                        } while ((attackedPlayer != player.playerID) && (attackedPlayer != 1 && attackedPlayer != 2 && attackedPlayer != 3 && attackedPlayer != 4))
                        
                        print("Choose a character from the enemy team you want to attack")
                        players[attackedPlayer - 1].printName()
                        // We check if the character can be attacked
                        if let choosenAttackedCharacter = players[attackedPlayer - 1].characterCanPlay(teamArray: players[attackedPlayer - 1].team) {
                            // We get the index of the character who is going to be attacked
                            if let indexAttacked = players[attackedPlayer - 1].indexCharacter(chara: choosenAttackedCharacter){
                                player.team[indexChoosenAttacker!].attack(player: choosenAttackedCharacter)
                                
                                //If a character's life is less or equal to 0 we remove him
                                if players[attackedPlayer - 1].team[indexAttacked].healthPoint <= 0 {
                                    players[attackedPlayer - 1].removeCharacter(index: indexAttacked)
                                }
                                //If the number of character from a player's team is equal to 0 we remove him
                                if players[attackedPlayer - 1].team.count == 0 {
                                    players.remove(at: attackedPlayer - 1)
                                }
                            }
                        }
                        
                    }// Fin du if pour verifier si un joueur peut attaquer et s'il a choisi une equipe valable
                    numberOfRounds += 1
                    if players.count == 1 {
                        loop = false
                    }
                
                case 2:
                    print("Choose a character to heal")
                    player.printName()
                    //Get the player from the attacking who is going to attack
                    if let healerPlayer = player.characterCanPlay(teamArray: player.team) {
                        print("On est dans la boucle pour soigner")
                        if let indexHealer = player.indexCharacter(chara: healerPlayer){
                            
                            print("Choose a character from your team")
                            player.printName()
                            // We check if the character can be healed
                            if let choosenHealedCharacter = player.characterCanPlay(teamArray: player.team) {
                                // We get the index of the character who is going to be healed
                                player.team[indexHealer].heal(player: choosenHealedCharacter)
                            }
                        }
                    }// Fin du if pour verifier si un joueur peut attaquer et s'il a choisi une equipe valable
                    numberOfRounds += 1
                    
                    
                default:
                    fatalError()
                } // Fin du switch de player Action
                
            } //Fin boucle for principale
            
        } //Fin boucle while principale
        
    } // Fin de la fonction
    
    
    private func resumeGame(){
        print("Number of rounds : \(self.numberOfRounds)")
        print("The winner is")
        for player in players {
            print("Player \(player.playerID)")
        }
    }
    public func start(){
        self.askNumberOfPlayer()
        self.initializePlayers()
        self.initializeCharacters()
        self.mainLoop()
        self.resumeGame()
    }
    
    
    
}
