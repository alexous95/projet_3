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
    
    private var numberOfPlayers    : Int
    private var numberOfCharacters : Int
    
    private var numberOfRounds  : Int = 0
    
    init(numberOfPlayers : Int, numberOfCharacters : Int){
        self.numberOfPlayers = numberOfPlayers
        self.numberOfCharacters = numberOfCharacters
    }
    
    
    private func returnPlayersID(exception : Player) -> [String]{
        var resultArray : [String] = []
        for player in players {
            if player.playerID != exception.playerID {
                resultArray.append("\(player.playerID)")
            }
        }
        return resultArray
    }
    
    private func acceptedPlayer(exception : Player) -> [Int]{
        var resultArray : [Int] = []
        for player in players {
            if player.playerID != exception.playerID{
                resultArray.append(player.playerID)
            }
        }
        return resultArray
    }
    
    private func initializePlayers(){
        for i in 1...numberOfPlayers{
            let player = Player(playerID: i)
            players.append(player)
        }
    }
    
    private func initializeCharacters(maxCharacters : Int){
        for player in players {
            player.addCharacter(nameArray: &self.nameArray, maxCharacters : maxCharacters)
        }
    }
    
    private func removePlayer(player : Player){
        var i = 0
        for playerTmp in players{
            if playerTmp.playerID == player.playerID{
                players.remove(at: i)
            }
            i += 1
        }
    }
    
    private func mainLoop(){
        
        var loop : Bool = true
        
        //The text i'm using to manage the different choices for the action
        let actionDescription = ["What do you want to do ?"]
        let actionChoice = ["Attack", "Heal"]
        let wrongAction = ["Wrong choice", "Choose a valid action"]
        
        
        //While there is more than one player with caracters alive we continue our loop
        while(loop){
            
            //For each players we must show the same menu
            for player in players{
                if loop == false {
                    continue
                }
                
                //The text i'm using to manage the choice of an attacked player
                let charaChoiceDescription = ["Choose the ennemy player you want to fight"]
                let charaChoice = returnPlayersID(exception: player)
                let wrongChoice = ["Wrong choice", "Choose a valid player"]
                let acceptedValue = self.acceptedPlayer(exception: player)
                
                var playerAction : PlayerActions = .Attack
                
                print("----------------------Player \(player.playerID) turn's----------------------\n")
                print("RECAP OF THE TEAM")
                player.detailTeam()
                print("")
                
                playerAction = inputManager.askAction(descriptionParameters: actionDescription, choiceParametres: actionChoice, wrongDescription: wrongAction, valueAccepted: [1, 2])
                
                switch playerAction {
                    
                case .Attack:
                    
                    //Get the character from the team who is going to attack
                    let choosenCharacter = player.characterCanPlay(teamArray: player.team)
                    
                    var AttackedPlayer : Player?
                    
                    //We get the player who is going to be atacked
                    AttackedPlayer = inputManager.askPlayer(descriptionParameters: charaChoiceDescription, choiceParametres: charaChoice, wrongDescription: wrongChoice, valueAccepted: acceptedValue, playersArray: self.players)
                    
                    // We check if the character can be attacked
                    let AttackedCharacter = AttackedPlayer!.characterCanPlay(teamArray: AttackedPlayer!.team)
                    
                    // We get the index of the character who is going to be attacked
                    choosenCharacter.attack(player: AttackedCharacter)
                    
                    //If a character's life is less or equal to 0 we remove him
                    if AttackedCharacter.healthPoint <= 0 {
                        AttackedPlayer!.removeCharacter(character: AttackedCharacter)
                    }
                    //If the number of character from a player's team is equal to 0 we remove him
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
                    
                    // We get the index of the character who is going to be healed
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
