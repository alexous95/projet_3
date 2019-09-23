//
//  main.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

// MARK: - VARAIBLES

// Ce sont les variables qui vont representer nos joueurs pendant la partie
var player1 = Player()
var player2 = Player()

//Represente le nombre de tour dans notre jeu
var numberOfRound = 0

//Tableau pour stocker chaque nom et ainsi pouvoir verifier si chaque nom est unique
var nameArray : [String] = []

//Represente le nombre de personnage. On l'utilise ici pour s'assurer que chaque joueur a bien 3 personnages
var numberOfCharacters = 0

//Represente le nombre total de point de vie de l'equipe. On s'en servira de condition pour quitter la boucle de jeu
var totalHpPlayer1 = 120
var totalHpPlayer2 = 120

//Cette boucle sert a l'initialisation des personnages du joueur 1
print("Bienvenue dans le jeu du Projet numero 3\n")

print("Chaque joueurs devra creer 3 personnages avec un nom differents pour chacun")
print("Chaques personnages aura une arme qui servira a reduire les points de vie des autres personnages\n")

//MARK: - INITIALISATION JOUEUR 1
repeat{
    print("Joueur 1 choisissez un nom pour votre personnage numero \(numberOfCharacters+1) :\n")
    var inputName = readLine()
    print("")
    
    if inputName != nil {
        if nameArray.contains(inputName!){
            repeat {
                print("Ce nom a deja ete choisi")
                print("Choisissez-en un autre")
                inputName = readLine()
                print("")
            }while(nameArray.contains(inputName!))
        }
    }
    nameArray.append(inputName!)
    
    print("Joueur 1 choisissez une arme pour votre personnage numero \(numberOfCharacters+1) :")
    print("Choisissez un nombre correspondant a l'arme desirer :")
    print("1 : Epée")
    print("2 : Fusil")
    print("")
    
    let weaponInput = readLine()
    print("")
    
    if let weapon = weaponInput{
        switch Int(weapon) {
        case 1:
            if inputName != nil {
                player1.team.append(Character(name: inputName!, weapon: Sword()))
            }
        case 2 :
            if inputName != nil {
                player1.team.append(Character(name: inputName!, weapon: Gun()))
            }
        default:
            fatalError()
        }
    }
    numberOfCharacters += 1
    
}while(numberOfCharacters < 3)

//On remet a zero la variable numberOfCharacters pour s'assurer qu'on aura bien 3 personnages pour le joueur 2
numberOfCharacters = 0

//MARK: - INITIALISATION JOUEUR 2

//Cette boucle sert a l'initialisation du joueur 2
repeat{
    print("Joueur 2 choisissez un nom pour votre personnage numero \(numberOfCharacters+1) :\n")
    var inputName = readLine()
    print("")
    
    if inputName != nil {
        if nameArray.contains(inputName!){
            repeat {
                print("Ce nom a deja ete choisi")
                print("Choisissez-en un autre")
                inputName = readLine()
                print("")
                
            }while(nameArray.contains(inputName!))
        }
    }
    nameArray.append(inputName!)
    
    print("Joueur 2 choisissez une arme pour votre personnage numero \(numberOfCharacters+1) :")
    print("Choisissez un nombre correspondant a l'arme desirer :")
    print("1 : Epée")
    print("2 : Fusil")
    print("")
    
    let weaponInput = readLine()
    print("")
    
    if let weapon = weaponInput{
        switch Int(weapon) {
        case 1:
            if inputName != nil {
                player2.team.append(Character(name: inputName!, weapon: Sword()))
            }
        case 2 :
            if inputName != nil {
                player2.team.append(Character(name: inputName!, weapon: Gun()))
            }
        default:
            fatalError()
        }
    }
    numberOfCharacters += 1
    
}while(numberOfCharacters < 3)

// MARK: - TOUR JOUEUR 1

//Cette boucle est la boucle principale du jeu qui permet de faire combattre les joueurs
repeat{
    print("Tour du joueur 1\n")
    
    print("Recapitulatif de l'equipe")
    player1.detailTeam()
    print("")
    
    print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
    
    player1.printName()
    print("")
    
    var choiceP1 = readLine()
    print("")
    
    if (Int(choiceP1!)! > 3 || Int(choiceP1!)! < 1 ) {
        repeat{
            print("Mauvais choix")
            print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
            
            player1.printName()
            print("")
            
            choiceP1 = readLine()
            print("")
            
        }while(Int(choiceP1!)! > 3 || Int(choiceP1!)! < 1 )
    }
    
    print("Recapitulatif de l'equipe adverse")
    player2.detailTeam()
    print("")
    
    print("Choisissez le numero du personnage a attaquer\n")
    
    player2.printName()
    print("")
    
    var newChoiceP1 = readLine()
    print("")
    
    if (Int(newChoiceP1!)! > 3 || Int(newChoiceP1!)! < 1 ) {
        repeat{
            print("Mauvais choix")
            print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
            
            player2.printName()
            print("")
            
            newChoiceP1 = readLine()
            print("")
            
        }while(Int(newChoiceP1!)! > 3 || Int(newChoiceP1!)! < 1 )
    }
    switch Int(newChoiceP1!) {
    case 1:
        player1.team[Int(choiceP1!)!].attack(player: player2.team[0])
        totalHpPlayer2 -= player1.team[Int(choiceP1!)!].weapon.dammage
    case 2:
        player1.team[Int(choiceP1!)!].attack(player: player2.team[1])
        totalHpPlayer2 -= player1.team[Int(choiceP1!)!].weapon.dammage
    case 3:
        player1.team[Int(choiceP1!)!].attack(player: player2.team[2])
        totalHpPlayer2 -= player1.team[Int(choiceP1!)!].weapon.dammage
    default:
        fatalError()
    }
    
    // MARK: - TOUR JOUEUR 2
    print("Tour du joueur 2\n")
    
    print("Recapitulatif de l'equipe")
    player2.detailTeam()
    print("")
    
    print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
    
    player2.printName()
    print("")
    
    var choiceP2 = readLine()
    print("")
    
    if (Int(choiceP2!)! > 3 || Int(choiceP2!)! < 1 ) {
        repeat{
            print("Mauvais choix")
            print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
            
            player2.printName()
            print("")
            
            choiceP2 = readLine()
            print("")
            
        }while(Int(choiceP2!)! > 3 || Int(choiceP2!)! < 1 )
    }
    
    print("Recapitulatif de l'equipe adverse")
    player1.detailTeam()
    print("")
    
    print("Choisissez le numero du personnage a attaquer\n")
    
    player1.printName()
    print("")
    
    var newChoiceP2 = readLine()
    print("")
    
    if (Int(newChoiceP2!)! > 3 || Int(newChoiceP2!)! < 1 ) {
        repeat{
            print("Mauvais choix")
            print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
            
            player1.printName()
            print("")
            
            newChoiceP2 = readLine()
            print("")
            
        }while(Int(newChoiceP2!)! > 3 || Int(newChoiceP2!)! < 1 )
    }
    switch Int(newChoiceP2!) {
    case 1:
        player1.team[Int(choiceP2!)!].attack(player: player1.team[0])
        totalHpPlayer1 -= player2.team[Int(choiceP2!)!].weapon.dammage
    case 2:
        player1.team[Int(choiceP2!)!].attack(player: player1.team[1])
        totalHpPlayer1 -= player2.team[Int(choiceP2!)!].weapon.dammage
    case 3:
        player1.team[Int(choiceP2!)!].attack(player: player1.team[2])
        totalHpPlayer1 -= player2.team[Int(choiceP2!)!].weapon.dammage
    default:
        fatalError()
    }
    
    
    numberOfRound += 1
    
    
}while(totalHpPlayer1 != 0 || totalHpPlayer2 != 0)
