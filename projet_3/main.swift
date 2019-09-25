//
//  main.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

// MARK: - VARIABLES

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

//Represente les choix des deux utilisateurs
var choiceStrPlayer1 : String
var choiceIntPlayer1 : Int

var choiceStrPlayer2 : String
var choiceIntPlayer2 : Int

// MARK: - FUNCTIONS
//Fonctions permettant de lire une entre de l'utilisateur
func inputInt() -> Int {
    let readData = readLine()
    
    if let dataInt = readData {
        return Int(dataInt)!
    }
    return 0
}

func inputStr() -> String {
    let readData = readLine()
    if let data = readData {
        return data
    }
    return "On a un probleme"
}

//Cette boucle sert a l'initialisation des personnages du joueur 1
print("Bienvenue dans le jeu du Projet numero 3\n")

print("Chaque joueurs devra creer 3 personnages avec un nom differents pour chacun")
print("Chaques personnages aura une arme qui servira a reduire les points de vie des autres personnages\n")

//MARK: - INITIALISATION JOUEUR 1
repeat{
    print("Joueur 1 choisissez un nom pour votre personnage numero \(numberOfCharacters+1) :\n")
    choiceStrPlayer1 = inputStr()
    print("")
    
    if nameArray.contains(choiceStrPlayer1){
        repeat {
            print("Ce nom a deja ete choisi")
            print("Choisissez-en un autre")
            choiceStrPlayer1 = inputStr()
            print("")
            
        }while(nameArray.contains(choiceStrPlayer1))
    }
    nameArray.append(choiceStrPlayer1)
    
    print("Joueur 1 choisissez une arme pour votre personnage numero \(numberOfCharacters+1) :")
    repeat{
        print("Choisissez un nombre correspondant a l'arme desirer :")
        print("1 : Epée")
        print("2 : Fusil")
        print("")
        choiceIntPlayer1 = inputInt()
        print("")
    }while choiceIntPlayer1 != 1 && choiceIntPlayer1 != 2
    
    
    switch choiceIntPlayer1 {
    case 1:
            player1.team.append(Character(name: choiceStrPlayer1, weapon: Sword()))
        
    case 2 :
            player1.team.append(Character(name: choiceStrPlayer1, weapon: Gun()))
        
    default:
        fatalError()
    }
    numberOfCharacters += 1
    
}while(numberOfCharacters < 3)


//On remet a zero la variable numberOfCharacters pour s'assurer qu'on aura bien 3 personnages pour le joueur 2
numberOfCharacters = 0

//MARK: - INITIALISATION JOUEUR 2

//Cette boucle sert a l'initialisation du joueur 2
repeat{
    print("Joueur 2 choisissez un nom pour votre personnage numero \(numberOfCharacters+1) :\n")
    choiceStrPlayer2 = inputStr()
    print("")
    
    if nameArray.contains(choiceStrPlayer2){
        repeat {
            print("Ce nom a deja ete choisi")
            print("Choisissez-en un autre")
            choiceStrPlayer2 = inputStr()
            print("")
            
        }while(nameArray.contains(choiceStrPlayer2))
    }
    nameArray.append(choiceStrPlayer2)
    
    print("Joueur 2 choisissez une arme pour votre personnage numero \(numberOfCharacters+1) :")
    
    repeat{
        print("Choisissez un nombre correspondant a l'arme desirer :")
        print("1 : Epée")
        print("2 : Fusil")
        print("")
        
        choiceIntPlayer2 = inputInt()
        print("")
    }while choiceIntPlayer2 != 1 && choiceIntPlayer2 != 2
   
    
    
    switch choiceIntPlayer2 {
    case 1:
        player2.team.append(Character(name: choiceStrPlayer2, weapon: Sword()))
        
    case 2 :
        player2.team.append(Character(name: choiceStrPlayer2, weapon: Gun()))
        
    default:
        fatalError()
    }
    numberOfCharacters += 1
    
}while(numberOfCharacters < 3)

// MARK: - TOUR JOUEUR 1

//Cette boucle est la boucle principale du jeu qui permet de faire combattre les joueurs
var choiceP1 : Int = 0
var newChoiceP1 : Int = 0

var choiceP2 : Int = 0
var newChoiceP2 : Int = 0

repeat{
    // On verifie que chaque team a encore des joueurs sinon on quitte la boucle de jeu
    if player1.team.count == 0{
        numberOfRound += 1
        break
    }
    print("----------------------TOUR DU JOUEUR 1----------------------\n")
    
    
    
    print("RECAPITULATIF DE L'EQUIPE")
    player1.detailTeam()
    print("")
    
    print("Que voulez-vous faire ?")
    print("1: Attaquer")
    print("2: Se Soigner")
    print("")
    
    let action = inputInt()
    print("")
    
    switch action {
        
    // Si le joueur choisis 1 alors il choisie d'attaquer
    // Cela correspond au premier cas de notre switch
    case 1:
        print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
        
        player1.printName()
        print("")
        
        // On regarde combien il reste de joueur dans le tableau du joueur et en fonction de ce resultat
        // on contraint le joueur a choisir un numero compris entre 1 et 3
        
        // MARK: - ATTAQUE
        
        switch player1.team.count{
            
        // Dans le cas ou on a qu'un seul joueur le choix est forcement 1
            
        case 1:
            choiceP1 = inputInt()
            print("")
            if choiceP1 != 1 {
                repeat{
                    print("Mauvais choix")
                    print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
                    
                    player1.printName()
                    print("")
                    
                    choiceP1 = inputInt()
                    print("")
                }while choiceP1 != 1
            }
            
        // Dans le cas ou on a deux joueurs le choix est 1 ou 2
        case 2:
            choiceP1 = inputInt()
            print("")
            
            if (choiceP1 != 1) && (choiceP1 != 2){
                repeat{
                    print("Mauvais choix")
                    print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
                    
                    player1.printName()
                    print("")
                    
                    choiceP1 = inputInt()
                    print("")
                }while (choiceP1 != 1) && (choiceP1 != 2)
            }
            
        // Dans le cas ou tous les joueurs sont vivant le choix est 1, 2 ou 3
        case 3:
            choiceP1 = inputInt()
            print("")
            
            if (choiceP1 != 1) && (choiceP1 != 2) && (choiceP1 != 3){
                repeat{
                    print("Mauvais choix")
                    print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
                    
                    player1.printName()
                    print("")
                    
                    choiceP1 = inputInt()
                    print("")
                }while (choiceP1 != 1) && (choiceP1 != 2) && (choiceP1 != 3)
            }
        default:
            break
        }
        
        print("Recapitulatif de l'equipe adverse")
        player2.detailTeam()
        print("")
        
        print("Choisissez le numero du personnage a attaquer\n")
        
        player2.printName()
        print("")
        
        // Ce switch permet de contraindre l'utilisateur a attaquer seulement les personnages encore en vie
        switch player2.team.count {
        case 1:
            newChoiceP1 = inputInt()
            print("")
            
            if newChoiceP1 != 1{
                repeat{
                    print("Mauvais choix cas ou il ne reste qu'un joueur")
                    print("Choisissez le numero du personnage que vous souhaitez attaquer\n")
                    
                    player2.printName()
                    print("")
                    
                    newChoiceP1 = inputInt()
                    print("")
                    
                }while newChoiceP1 != 1
            }
            player1.team[choiceP1 - 1].attack(player: player2.team[0])
            
            if player2.team[0].healthPoint <= 0{
                player2.removeCharacter(index: 0)
            }
            
            totalHpPlayer2 -= player1.team[choiceP1 - 1].weapon.dammage
            
        case 2:
            newChoiceP1 = inputInt()
            print("")
            
            if (newChoiceP1 != 1) && (newChoiceP1 != 2) {
                repeat{
                    print("Mauvais choix cas ou il ne reste que 2 joueurs")
                    print("Choisissez le numero du personnage que vous souhaitez attaquer\n")
                    
                    player2.printName()
                    print("")
                    
                    newChoiceP1 = inputInt()
                    print("")
                    
                }while (newChoiceP1 != 1) && (newChoiceP1 != 2)
            }
            
            switch newChoiceP1 {
            case 1:
                player1.team[choiceP1 - 1].attack(player: player2.team[0])
                
                if player2.team[0].healthPoint <= 0{
                    player2.removeCharacter(index: 0)
                }
                
                totalHpPlayer2 -= player1.team[choiceP1 - 1].weapon.dammage
                
            case 2:
                player1.team[choiceP1 - 1].attack(player: player2.team[1])
                
                if player2.team[1].healthPoint <= 0 {
                    player2.removeCharacter(index: 1)
                }
                
                totalHpPlayer2 -= player1.team[choiceP1 - 1].weapon.dammage
            default:
                break
            }
            
        case 3:
            newChoiceP1 = inputInt()
            print("")
            
            if ( newChoiceP1 != 1) && (newChoiceP1 != 2) && (newChoiceP1 != 3){
                repeat{
                    print("Mauvais choix cas ou il reste tous les joueurs")
                    print("Choisissez le numero du personnage que vous souhaitez attaquer\n")
                    
                    player2.printName()
                    print("")
                    
                    newChoiceP1 = inputInt()
                    print("")
                    
                }while (newChoiceP1 != 1) && (newChoiceP1 != 2) && (newChoiceP1 != 3)
            }
            switch newChoiceP1 {
            case 1:
                player1.team[choiceP1 - 1].attack(player: player2.team[0])
                
                if player2.team[0].healthPoint <= 0{
                    player2.removeCharacter(index: 0)
                }
                
                totalHpPlayer2 -= player1.team[choiceP1 - 1].weapon.dammage
                
            case 2:
                player1.team[choiceP1 - 1].attack(player: player2.team[1])
                
                if player2.team[1].healthPoint <= 0 {
                    player2.removeCharacter(index: 1)
                }
                
                totalHpPlayer2 -= player1.team[choiceP1 - 1].weapon.dammage
                
            case 3:
                player1.team[choiceP1 - 1].attack(player: player2.team[2])
                
                if player2.team[2].healthPoint <= 0 {
                    player2.removeCharacter(index: 2)
                }
                
                totalHpPlayer2 -= player1.team[choiceP1 - 1].weapon.dammage
                
            default:
                break
            }
            
        default:
            break
        }
        
    // Si le joueur choisi 2 alors il choisie de soigner
    // Cela correspond au cas numero 2 de notre switch
        
    // MARK: - SOIN
        
    case 2:
        print("Choisissez le numero du personnage que vous souhaitez utiliser pour le soin\n")
        
        player1.printName()
        print("")
        
        //Ce switch permet de forcer l'utilisateur a choisir exactement les joueurs encore en vie
        //On ne peut pas ressuciter de perssonnage
        
        switch player1.team.count {
        case 1:
            choiceP1 = inputInt()
            print("")
            
            if choiceP1 != 1 {
                repeat{
                    print("Mauvais choix")
                    print("Choisissez le numero du personnage que vous utiliser pour le soin\n")
                    
                    player1.printName()
                    print("")
                    
                    choiceP1 = inputInt()
                    print("")
                }while choiceP1 != 1
            }
            
        case 2:
            choiceP1 = inputInt()
            print("")
            
            if choiceP1 != 1 && choiceP1 != 2 {
                repeat{
                    print("Mauvais choix")
                    print("Choisissez le numero du personnage que vous utiliser pour le soin\n")
                    
                    player1.printName()
                    print("")
                    
                    choiceP1 = inputInt()
                    print("")
                }while choiceP1 != 1 && choiceP1 != 2
            }
            
        case 3:
            choiceP1 = inputInt()
            print("")
            
            if choiceP1 != 1 && choiceP1 != 2 && choiceP1 != 3 {
                repeat{
                    print("Mauvais choix")
                    print("Choisissez le numero du personnage que vous utiliser pour le soin\n")
                    
                    player1.printName()
                    print("")
                    
                    choiceP1 = inputInt()
                    print("")
                }while choiceP1 != 1 && choiceP1 != 2 && choiceP1 != 3
            }
        default:
            break
        }
        
        print("Recapitulatif de l'équipe")
        player1.printName()
        print("")
        
        print("Choisissez le numero du personnage à soigner\n")
        
        player1.printName()
        print("")
        
        // Ce switch permet de choisir le personnage qui sera soigner
        switch player2.team.count {
        case 1:
            newChoiceP1 = inputInt()
            print("")
            
            if newChoiceP1 != 1{
                repeat{
                    print("Mauvais choix")
                    print("Choisissez le numero du personnage que vous souhaitez soigner\n")
                    
                    player1.printName()
                    print("")
                    
                    newChoiceP1 = inputInt()
                    print("")
                    
                }while newChoiceP1 != 1
            }
            player1.team[choiceP1 - 1].heal(player: player1.team[newChoiceP1 - 1])
            
        case 2:
            newChoiceP1 = inputInt()
            print("")
            
            if (newChoiceP1 != 1) && (newChoiceP1 != 2) {
                repeat{
                    print("Mauvais choix")
                    print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
                    
                    player1.printName()
                    print("")
                    
                    newChoiceP1 = inputInt()
                    print("")
                    
                }while (newChoiceP1 != 1) && (newChoiceP1 != 2)
            }
            
            switch newChoiceP1 {
            case 1:
                player1.team[choiceP1 - 1].heal(player: player1.team[newChoiceP1 - 1])
                
            case 2:
                player1.team[choiceP1 - 1].heal(player: player1.team[newChoiceP1 - 1])
                
            default:
                break
            }
            
        case 3:
            newChoiceP1 = inputInt()
            print("")
            
            if ( newChoiceP1 != 1) && (newChoiceP1 != 2) && (newChoiceP1 != 3){
                repeat{
                    print("Mauvais choix")
                    print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
                    
                    player1.printName()
                    print("")
                    
                    newChoiceP1 = inputInt()
                    print("")
                    
                }while (newChoiceP1 != 1) && (newChoiceP1 != 2) && (newChoiceP1 != 3)
            }
            switch newChoiceP1 {
            case 1:
                player1.team[choiceP1 - 1].heal(player: player1.team[newChoiceP1 - 1])
                
            case 2:
                player1.team[choiceP1 - 1].heal(player: player1.team[newChoiceP1 - 1])
                
            case 3:
                player1.team[choiceP1 - 1].heal(player: player1.team[newChoiceP1 - 1])
                
            default:
                break
            }
            
        default:
            break
        }
        
    default:
        break
    }
    
   
    
    // MARK: - TOUR JOUEUR 2
    // On verifie que chaque team a encore des joueurs sinon on quitte la boucle de jeu
    if player2.team.count <= 0{
        numberOfRound += 1
        break
    }
    print("----------------------TOUR DU JOUEUR 2----------------------\n")
    
    print("Recapitulatif de l'equipe")
    player2.detailTeam()
    print("")
    
    print("Que voulez-vous faire ?")
    print("1: Attaquer")
    print("2: Se Soigner")
    print("")
    
    let action2 = inputInt()
    print("")
    
    switch action2 {
           
       // Si le joueur choisis 1 alors il choisie d'attaquer
       // Cela correspond au premier cas de notre switch
       case 1:
           print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
           
           player2.printName()
           print("")
           
           // On regarde combien il reste de joueur dans le tableau du joueur et en fonction de ce resultat
           // on contraint le joueur a choisir un numero compris entre 1 et 3
           
           // MARK: - ATTAQUE
           
           switch player2.team.count{
               
           // Dans le cas ou on a qu'un seul joueur le choix est forcement 1
               
           case 1:
               choiceP2 = inputInt()
               print("")
               if choiceP2 != 1 {
                   repeat{
                       print("Mauvais choix")
                       print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
                       
                       player2.printName()
                       print("")
                       
                       choiceP2 = inputInt()
                       print("")
                   }while choiceP2 != 1
               }
               
           // Dans le cas ou on a deux joueurs le choix est 1 ou 2
           case 2:
               choiceP2 = inputInt()
               print("")
               
               if (choiceP2 != 1) && (choiceP2 != 2){
                   repeat{
                       print("Mauvais choix")
                       print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
                       
                       player2.printName()
                       print("")
                       
                       choiceP2 = inputInt()
                       print("")
                   }while (choiceP2 != 1) && (choiceP2 != 2)
               }
               
           // Dans le cas ou tous les joueurs sont vivant le choix est 1, 2 ou 3
           case 3:
               choiceP2 = inputInt()
               print("")
               
               if (choiceP2 != 1) && (choiceP2 != 2) && (choiceP2 != 3){
                   repeat{
                       print("Mauvais choix")
                       print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
                       
                       player2.printName()
                       print("")
                       
                       choiceP2 = inputInt()
                       print("")
                   }while (choiceP2 != 1) && (choiceP2 != 2) && (choiceP2 != 3)
               }
           default:
               break
           }
           
           print("Recapitulatif de l'equipe adverse")
           player1.detailTeam()
           print("")
           
           print("Choisissez le numero du personnage a attaquer\n")
           
           player1.printName()
           print("")
           
           // Ce switch permet de contraindre l'utilisateur a attaquer seulement les personnages encore en vie
           switch player1.team.count {
           case 1:
               newChoiceP2 = inputInt()
               print("")
               
               if newChoiceP2 != 1{
                   repeat{
                       print("Mauvais choix cas ou il ne reste qu'un joueur")
                       print("Choisissez le numero du personnage que vous souhaitez attaquer\n")
                       
                       player1.printName()
                       print("")
                       
                       newChoiceP2 = inputInt()
                       print("")
                       
                   }while newChoiceP2 != 1
               }
               player2.team[choiceP2 - 1].attack(player: player1.team[0])
               
               if player1.team[0].healthPoint <= 0{
                   player1.removeCharacter(index: 0)
               }
               
               totalHpPlayer1 -= player2.team[choiceP1 - 1].weapon.dammage
               
           case 2:
               newChoiceP2 = inputInt()
               print("")
               
               if (newChoiceP2 != 1) && (newChoiceP2 != 2) {
                   repeat{
                       print("Mauvais choix cas ou il ne reste que 2 joueurs")
                       print("Choisissez le numero du personnage que vous souhaitez attaquer\n")
                       
                       player1.printName()
                       print("")
                       
                       newChoiceP2 = inputInt()
                       print("")
                       
                   }while (newChoiceP2 != 1) && (newChoiceP2 != 2)
               }
               
               switch newChoiceP1 {
               case 1:
                   player2.team[choiceP2 - 1].attack(player: player1.team[0])
                   
                   if player1.team[0].healthPoint <= 0{
                       player1.removeCharacter(index: 0)
                   }
                   
                   totalHpPlayer1 -= player2.team[choiceP1 - 1].weapon.dammage
                   
               case 2:
                   player2.team[choiceP2 - 1].attack(player: player1.team[1])
                   
                   if player1.team[1].healthPoint <= 0 {
                       player1.removeCharacter(index: 1)
                   }
                   
                   totalHpPlayer1 -= player2.team[choiceP1 - 1].weapon.dammage
               default:
                   break
               }
               
           case 3:
               newChoiceP2 = inputInt()
               print("")
               
               if ( newChoiceP2 != 1) && (newChoiceP2 != 2) && (newChoiceP2 != 3){
                   repeat{
                       print("Mauvais choix")
                       print("Choisissez le numero du personnage que vous souhaitez attaquer\n")
                       
                       player1.printName()
                       print("")
                       
                       newChoiceP2 = inputInt()
                       print("")
                       
                   }while (newChoiceP2 != 1) && (newChoiceP2 != 2) && (newChoiceP2 != 3)
               }
               switch newChoiceP2 {
               case 1:
                   player2.team[choiceP2 - 1].attack(player: player1.team[0])
                   
                   if player1.team[0].healthPoint <= 0{
                       player1.removeCharacter(index: 0)
                   }
                   
                   totalHpPlayer1 -= player2.team[choiceP2 - 1].weapon.dammage
                   
               case 2:
                   player2.team[choiceP2 - 1].attack(player: player1.team[1])
                   
                   if player1.team[1].healthPoint <= 0 {
                       player1.removeCharacter(index: 1)
                   }
                   
                   totalHpPlayer1 -= player2.team[choiceP1 - 1].weapon.dammage
                   
               case 3:
                   player2.team[choiceP2 - 1].attack(player: player1.team[2])
                   
                   if player1.team[2].healthPoint <= 0 {
                       player1.removeCharacter(index: 2)
                   }
                   
                   totalHpPlayer1 -= player2.team[choiceP1 - 1].weapon.dammage
                   
               default:
                   break
               }
               
           default:
               break
           }
           
       // Si le joueur choisi 2 alors il choisie de soigner
       // Cela correspond au cas numero 2 de notre switch
           
       // MARK: - SOIN
           
       case 2:
           print("Choisissez le numero du personnage que vous souhaitez utiliser pour le soin\n")
           
           player2.printName()
           print("")
           
           //Ce switch permet de forcer l'utilisateur a choisir exactement les joueurs encore en vie
           //On ne peut pas ressuciter de perssonnage
           
           switch player2.team.count {
           case 1:
               choiceP2 = inputInt()
               print("")
               
               if choiceP2 != 1 {
                   repeat{
                       print("Mauvais choix")
                       print("Choisissez le numero du personnage que vous utiliser pour le soin\n")
                       
                       player2.printName()
                       print("")
                       
                       choiceP2 = inputInt()
                       print("")
                   }while choiceP2 != 1
               }
               
           case 2:
               choiceP2 = inputInt()
               print("")
               
               if choiceP2 != 1 && choiceP2 != 2 {
                   repeat{
                       print("Mauvais choix")
                       print("Choisissez le numero du personnage que vous utiliser pour le soin\n")
                       
                       player2.printName()
                       print("")
                       
                       choiceP2 = inputInt()
                       print("")
                   }while choiceP2 != 1 && choiceP2 != 2
               }
               
           case 3:
               choiceP2 = inputInt()
               print("")
               
               if choiceP2 != 1 && choiceP2 != 2 && choiceP2 != 3 {
                   repeat{
                       print("Mauvais choix")
                       print("Choisissez le numero du personnage que vous utiliser pour le soin\n")
                       
                       player2.printName()
                       print("")
                       
                       choiceP2 = inputInt()
                       print("")
                   }while choiceP2 != 1 && choiceP2 != 2 && choiceP2 != 3
               }
           default:
               break
           }
           
           print("Recapitulatif de l'équipe")
           player2.printName()
           print("")
           
           print("Choisissez le numero du personnage à soigner\n")
           
           player2.printName()
           print("")
           
           // Ce switch permet de choisir le personnage qui sera soigner
           switch player2.team.count {
           case 1:
               newChoiceP2 = inputInt()
               print("")
               
               if newChoiceP2 != 1{
                   repeat{
                       print("Mauvais choix")
                       print("Choisissez le numero du personnage que vous souhaitez soigner\n")
                       
                       player2.printName()
                       print("")
                       
                       newChoiceP2 = inputInt()
                       print("")
                       
                   }while newChoiceP2 != 1
               }
               player2.team[choiceP2 - 1].heal(player: player2.team[newChoiceP2 - 1])
               
           case 2:
               newChoiceP2 = inputInt()
               print("")
               
               if (newChoiceP2 != 1) && (newChoiceP2 != 2) {
                   repeat{
                       print("Mauvais choix")
                       print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
                       
                       player2.printName()
                       print("")
                       
                       newChoiceP2 = inputInt()
                       print("")
                       
                   }while (newChoiceP2 != 1) && (newChoiceP2 != 2)
               }
               
               switch newChoiceP2 {
               case 1:
                   player2.team[choiceP2 - 1].heal(player: player2.team[newChoiceP2 - 1])
                   
               case 2:
                   player2.team[choiceP2 - 1].heal(player: player1.team[newChoiceP2 - 1])
                   
               default:
                   break
               }
               
           case 3:
               newChoiceP2 = inputInt()
               print("")
               
               if ( newChoiceP2 != 1) && (newChoiceP2 != 2) && (newChoiceP2 != 3){
                   repeat{
                       print("Mauvais choix")
                       print("Choisissez le numero du personnage que vous souhaitez faire attaquer\n")
                       
                       player2.printName()
                       print("")
                       
                       newChoiceP2 = inputInt()
                       print("")
                       
                   }while (newChoiceP2 != 1) && (newChoiceP2 != 2) && (newChoiceP2 != 3)
               }
               switch newChoiceP2 {
               case 1:
                   player2.team[choiceP2 - 1].heal(player: player2.team[newChoiceP2 - 1])
                   
               case 2:
                   player2.team[choiceP2 - 1].heal(player: player2.team[newChoiceP2 - 1])
                   
               case 3:
                   player2.team[choiceP2 - 1].heal(player: player2.team[newChoiceP2 - 1])
                   
               default:
                   break
               }
               
           default:
               break
           }
           
       default:
           break
       }
    
    numberOfRound += 1
    
}while (player1.team.count > 0 && player2.team.count > 0)

if player1.team.count > 0 {
    print("Le joueur 1 a gagné la partie en \(numberOfRound) tour")
}
else{
    print("Le joueur 2 a gagné la partie en \(numberOfRound) tour")
}
