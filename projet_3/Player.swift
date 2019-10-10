//
//  Player.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

public class Player {
    
    // This variable is used to create mutiple players
    // This variable is used to avoid the hardcoded version of the main loop
    internal var playerID : Int
    
    // This variable is used to manage the input from the users
    var inputManager = InputManager()
    
    //Create an array wich contains the 3 characters of each player
    internal var team : [Character] = []
    
    // Initialize an instance of player with a number as argument
    init(playerID : Int) {
        self.playerID = playerID
    }
    
    //This function prints the name and the remaining healthpoint of the team
     public func detailTeam(){
        for chara in team {
            print("Character's name : \(chara.name)\t HealthPoint : \(chara.healthPoint)")
        }
    }
    
    // This functions is used to create a caracter and add it to the team array
    func addCharacter( nameArray : inout [String], maxCharacters : Int){
        var name : String = ""
        var weapon : WeaponType = .Sword
        var numberOfCharacters : Int = 0
        
        repeat{
            
            let descriptionName = ["Player \(self.playerID)", "Choose a name for your character number \(numberOfCharacters + 1) :"]
            
            name = inputManager.askStr(descriptionParameters: descriptionName, choiceParametres: nil, wrongDescription: Text.wrongName , stringArray: &nameArray)
            
            nameArray.append(name)
            
            weapon = inputManager.askWeapon(descriptionParameters: Text.descriptionWeapon , choiceParametres: Text.choiceWeapon , wrongDescription: Text.wrongWeapon, valueAccepted: [1, 2])
            
            switch weapon {
            case .Sword:
                self.team.append(Character(name: name, weapon: Sword()))
                
            case .Gun:
                self.team.append(Character(name: name, weapon: Gun()))
            }
            
            numberOfCharacters += 1
            
        }while(numberOfCharacters < maxCharacters)
    }
    
    // This functions return wether a character can play or not 
    func characterCanPlay(teamArray : [Character]) -> Character {
        
        let choiceName = self.returnCharactersName()
        
        var playerChoice : Int = -1
        var acceptedValue : [Int] = []
        
        for i in 1...teamArray.count{
            acceptedValue.append(i)
        }
        
        playerChoice = inputManager.askInt(descriptionParameters: Text.descriptionCharacter, choiceParametres: choiceName, wrongDescription: Text.wrongCharacter, valueAccepted: acceptedValue)
        
        return self.team[playerChoice-1]
    }
    
    // This function is used to remove characters
    func removeCharacter(character : Character){
        var i = 0
        for chara in team {
            if chara.name == character.name {
                self.team.remove(at: i)
            }
            i += 1
        }
    }
    
    // A function that returns the name of all characters in a team
    func returnCharactersName() -> [String]{
        var resultArray : [String] = []
        for chara in team {
            resultArray.append("\(chara.name)")
        }
        return resultArray
    }
    
    func printName(){
        var i = 1
        for chara in team {
            print("\(i) : \(chara.name)")
            i += 1
        }
    }
    
}
