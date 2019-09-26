//
//  Player.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

class Player {
    
    // This variable is used to create mutiple players
    // This variable is used to avoid the hardcoded version of the main loop
    var playerID : Int
    var inputManager = InputManager()
    
    //Create an array wich contains the 3 characters of each player
    var team : [Character] = []
    
    // Initialize an instance of player with a number as argument
    init(playerID : Int) {
        self.playerID = playerID
    }
    
    //This function prints the name and the remaining healthpoint of the team
    func detailTeam(){
        for chara in team {
            print("Character's name : \(chara.name)\t HealthPoint : \(chara.healthPoint)")
        }
    }
    
    func addCharacter( nameArray : inout [String]){
        var name : String = ""
        var weapon : Int = -1
        var numberOfCharacters : Int = 0
        
        repeat{
            print("Player \(self.playerID) choose a name for your character number \(numberOfCharacters+1) :\n")
            name = inputManager.inputStr()
            print("")
            
            if nameArray.contains(name){
                repeat {
                    print("This name has already been choosen")
                    print("Enter a new name")
                    name = inputManager.inputStr()
                    print("")
                    
                }while(nameArray.contains(name))
            }
            nameArray.append(name)
            
            print("Joueur \(self.playerID) choose a weapon for your personnage number \(numberOfCharacters+1) :")
            repeat{
                print("Choose a weapon corresponding to the desired weapon :")
                print("1 : Sword")
                print("2 : Gun")
                print("")
                weapon = inputManager.inputInt()
                print("")
            }while weapon != 1 && weapon != 2
            
            
            switch weapon {
            case 1:
                self.team.append(Character(name: name, weapon: Sword()))
                
            case 2 :
                self.team.append(Character(name: name, weapon: Gun()))
                
            default:
                fatalError()
            }
            numberOfCharacters += 1
            
        }while(numberOfCharacters < 3)
    }
        
    func removeCharacter(index : Int){
        self.team.remove(at: index)
    }
    
    func printName(){
        var i = 1
        for chara in team {
            print("\(i): \(chara.name)")
            i += 1
        }
    }
    
}
