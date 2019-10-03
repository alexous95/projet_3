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
    func addCharacter( nameArray : inout [String], maxCharacters : Int){
        var name : String = ""
        var weapon : Int = -1
        var numberOfCharacters : Int = 0
        
        repeat{
            print("On affiche le tableau de string pour verification")
            print(nameArray)
            name = inputManager.askStr(descriptionParameters: ["Player \(self.playerID) choose a name for your character number \(numberOfCharacters+1) :"], choiceParametres: nil, wrongDescription: ["This name has already been choosen", "Enter a new name"], stringArray: &nameArray)
            /*print("Player \(self.playerID) choose a name for your character number \(numberOfCharacters+1) :\n")
             name = inputManager.inputStr()
             print("")
             
             if nameArray.contains(name){
             repeat {
             print("This name has already been choosen")
             print("Enter a new name")
             name = inputManager.inputStr()
             print("")
             
             }while(nameArray.contains(name))
             }*/
            nameArray.append(name)
            weapon = inputManager.askInt(descriptionParameters: ["Choose the weapon you want"], choiceParametres: ["Sword", "Gun"], wrongDescription: ["Error, you chose a wrong number", "Enter a valid number"], valueAccepted: [1, 2])
            
        
            switch weapon {
            case 1:
                self.team.append(Character(name: name, weapon: Sword()))
                
            case 2 :
                self.team.append(Character(name: name, weapon: Gun()))
                
            default:
                fatalError()
            }
            numberOfCharacters += 1
            
        }while(numberOfCharacters < maxCharacters)
    }
    
    // This functions return wether a character can play or not 
    func characterCanPlay(teamArray : [Character]) -> Character? {
        
        var playerChoice : Int = -1
        
        switch teamArray.count{
            
        // Case where we only have 1 character
        case 1:
            playerChoice = inputManager.inputInt()
            print("")
            if playerChoice != 1 {
                repeat{
                    print("Bad choice")
                    print("Choose a valid number for the character\n")
                    
                    self.printName()
                    print("")
                    
                    playerChoice = inputManager.inputInt()
                    print("")
                    
                }while playerChoice != 1
            }
            return self.team[playerChoice - 1]
            
        // Case where we have 2 characters
        case 2:
            print("")
            playerChoice = inputManager.inputInt()
            print("")
            if (playerChoice != 1) && (playerChoice != 2){
                repeat{
                    print("Bad choice")
                    print("Choose a valid number for the character\n")
                    
                    self.printName()
                    print("")
                    
                    playerChoice = inputManager.inputInt()
                    print("")
                }while (playerChoice != 1) && (playerChoice != 2)
            }
            return self.team[playerChoice - 1]
            
        // Case where all the characters are alive
        case 3:
            playerChoice = inputManager.inputInt()
            print("")
            if (playerChoice != 1) && (playerChoice != 2) && (playerChoice != 3){
                repeat{
                    print("Bad choice")
                    print("Choose a valid number for the character\n")
                    
                    self.printName()
                    print("")
                    
                    playerChoice = inputManager.inputInt()
                    print("")
                }while (playerChoice != 1) && (playerChoice != 2) && (playerChoice != 3)
            }
            return self.team[playerChoice - 1]
        default:
            fatalError()
        }
    }
    
    // This function is used to remove characters at a given index
    func removeCharacter(index : Int){
        self.team.remove(at: index)
    }
    
    func indexCharacter(chara : Character) -> Int? {
        var i = 0
        for charater in team {
            if charater.name == chara.name {
                return i
            }
            i += 1
        }
        return nil
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
