//
//  Game.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 26/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

public class Game {
    
    // MARK: - VARIABLES
    
    private var inputManager = InputManager()
    
    private var players   : [Player] = []
    private var nameArray  : [String] = []
    
    private var numberOfPlayers    : Int
    private var numberOfCharacters : Int
    
    private var numberOfRounds  : Int = 0
    
    init(numberOfPlayers : Int, numberOfCharacters : Int){
        self.numberOfPlayers = numberOfPlayers
        self.numberOfCharacters = numberOfCharacters
    }
    
    
    //This function return an array of String which contains the IDs of all player excepted the player who is currently playing
    private func returnPlayersID(exception : Player) -> [String]{
        var resultArray : [String] = []
        for player in players {
            if player.playerID != exception.playerID {
                resultArray.append("\(player.playerID)")
            }
        }
        return resultArray
    }
    
    //This function is used to create an array of Int. This array is used as a list of accepted value for the user
    private func acceptedPlayer(exception : Player) -> [Int]{
        var resultArray : [Int] = []
        for player in players {
            if player.playerID != exception.playerID{
                resultArray.append(player.playerID)
            }
        }
        return resultArray
    }
    
    // This function initialize the players
    private func initializePlayers(){
        for i in 1...numberOfPlayers{
            let player = Player(playerID: i)
            players.append(player)
        }
    }
    
    // This function is used to ask the user to choose name for his characters
    private func initializeCharacters(maxCharacters : Int){
        for player in players {
            player.addCharacter(nameArray: &self.nameArray, maxCharacters : maxCharacters)
        }
    }
    
    // This function is used to remove a player
    private func removePlayer(player : Player){
        var i = 0
        for playerTmp in players{
            if playerTmp.playerID == player.playerID{
                players.remove(at: i)
            }
            i += 1
        }
    }
    
    // MARK: - MAINLOOP
    private func mainLoop(){
        
        var loop : Bool = true
        
        //While there is more than one player with caracters alive we continue our loop
        while(loop){
            for player in players{
                if loop == false {
                    continue
                }
                
                //The text i'm using to manage the choice of an attacked player
                let playerChoice = returnPlayersID(exception: player)
                let acceptedValue = self.acceptedPlayer(exception: player)
                
                var playerAction : PlayerActions = .Attack
                
                print("----------------------Player \(player.playerID) turn's----------------------\n")
                print("RECAP OF THE TEAM")
                player.detailTeam()
                print("")
                
                playerAction = inputManager.askAction(descriptionParameters: Text.actionDescription, choiceParametres: Text.actionChoice, wrongDescription: Text.wrongAction, valueAccepted: [1, 2])
                
                switch playerAction {
                    
                case .Attack:
                    //Get the character from the team who is going to attack
                    let choosenCharacter = player.characterCanPlay(teamArray: player.team)
                    
                    var AttackedPlayer : Player?
                    
                    //We get the player who is going to be atacked
                    AttackedPlayer = inputManager.askPlayer(descriptionParameters: Text.playerChoiceDescription, choiceParametres: playerChoice, wrongDescription: Text.wrongPlayer, valueAccepted: acceptedValue, playersArray: self.players)
                    
                    // We check if the character can be attacked
                    let AttackedCharacter = AttackedPlayer!.characterCanPlay(teamArray: AttackedPlayer!.team)
                    
                    // The two characters are fighting
                    choosenCharacter.attack(player: AttackedCharacter)
                    
                    // If a character's life is less or equal to 0 we remove him
                    if AttackedCharacter.healthPoint <= 0 {
                        AttackedPlayer!.removeCharacter(character: AttackedCharacter)
                    }
                    // If the number of character from a player's team is equal to 0 we remove him
                    if AttackedPlayer!.team.count == 0 {
                        removePlayer(player: AttackedPlayer!)
                    }
                    
                    numberOfRounds += 1
                    
                    if players.count == 1 {
                        loop = false
                    }
                    
                case .Heal:
                    //Get the character who is going to heal
                    let healerCharacter = player.characterCanPlay(teamArray: player.team)
                    
                    // We check if the character can be healed
                    let HealedCharacter = player.characterCanPlay(teamArray: player.team)
                    
                    // We heal the choosen character
                    healerCharacter.heal(player: HealedCharacter)
                    
                    numberOfRounds += 1
                    
                }
            }
        }
    }
    
    private func resumeGame(){
        print("Number of rounds : \(self.numberOfRounds)")
        print("The winner is")
        for player in players {
            print("Player \(player.playerID)")
        }
    }
    
    public func start(){
        self.initializePlayers()
        self.initializeCharacters(maxCharacters: numberOfCharacters)
        self.mainLoop()
        self.resumeGame()
    }
    
    
    
}
