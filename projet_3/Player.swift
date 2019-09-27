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
    
    // This variable is used to manage the input from the users
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
    
    // This functions is used to create a caracter and add it to the team array
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
    
    // This functions return wether a character can play or not 
    func characterCanPlay(teamArray : [Character]) -> Bool {
        print("Choose a character to attack")
        self.printName()
        
        var playerChoice : Int = inputManager.inputInt()
        
        switch teamArray.count{
            
        // Case where we only have 1 character
        case 1:
            print("")
            if playerChoice != 1 {
                repeat{
                    print("Bad choice")
                    print("Choose a valid number for the character who is going to attack\n")
                    
                    self.printName()
                    print("")
                    
                    playerChoice = inputManager.inputInt()
                    print("")
                    
                }while playerChoice != 1
                return true
            }
            
        // Case where we have 2 characters
        case 2:
            print("")
            if (playerChoice != 1) && (playerChoice != 2){
                repeat{
                    print("Bad choice")
                    print("Choose a valid number for the character who is going to attack\n")
                    
                    self.printName()
                    print("")
                    
                    playerChoice = inputManager.inputInt()
                    print("")
                }while (choiceP1 != 1) && (choiceP1 != 2)
                return true
            }
            
        // Case where all the characters are alive
        case 3:
            print("")
            
            if (playerChoice != 1) && (playerChoice != 2) && (playerChoice != 3){
                repeat{
                    print("Bad choice")
                    print("Choose a valid number for the character who is going to attack\n")
                    
                    self.printName()
                    print("")
                    
                    playerChoice = inputInt()
                    print("")
                }while (playerChoice != 1) && (playerChoice != 2) && (playerChoice != 3)
                return true
            }
        default:
            return false
        }
        return true
    }
        
    // This function is used to remove characters at a given index
    func removeCharacter(index : Int){
        self.team.remove(at: index)
    }
    
    // A function that displays the name of a character with a number 
    func printName(){
        var i = 1
        for chara in team {
            print("\(i): \(chara.name)")
            i += 1
        }
    }
    
}
