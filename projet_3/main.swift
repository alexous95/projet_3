//
//  main.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

// Ce sont les variables qui vont representer nos joueurs pendant la partie
var player1 = Player()
var player2 = Player()

//Represente le nombre de tour dans notre jeu
var numberOfRound = 0

//Represente le nombre de personnage. On l'utilise ici pour s'assurer que chaque joueur a bien 3 personnages
var numberOfCharacters = 0

print("Bienvenue dans le jeu du Projet numero 3\n")

print("Chaque joueurs devra creer 3 personnages avec un nom differents pour chacun")
print("Chaques personnages aura une arme qui servira a reduire les points de vie des autres personnages\n")

repeat{
    print("Joueur 1 choisissez un nom pour votre personnage numero \(numberOfCharacters+1) :")
    let inputName = readLine()
    
    print("Joueur 1 choisissez une arme pour votre personnage numero \(numberOfCharacters+1) :")
    print("Choisissez un nombre correspondant a l'arme desirer :")
    print("1 : Epée")
    print("2 : Fusil")
    let weaponInput = readLine()
    
    if let weapon = weaponInput{
        switch Int(weapon) {
        case 1:
            if let name = inputName{
                player1.team.append(Character(name: name, weapon: Sword()))
            }
        case 2 :
            if let name = inputName{
                player1.team.append(Character(name: name, weapon: Gun()))
            }
        default:
            fatalError()
        }
    }
    
    numberOfCharacters += 1
}while(numberOfCharacters < 3)



