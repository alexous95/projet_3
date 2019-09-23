//
//  Character.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

class Character {
    
    //Creation de la variable name qui contiendra le nom du personnage. Choisis par le joueur
    var name : String
    
    //Creation de la varianle healthpoint qui correspond au point de vie. Je l'ai initialise par defaut a 100
    var healthPoint : Int = 100
    
    //Creation de la variable weapon qui contient l'arme choisis par le joueur
    var weapon : Weapon
    
    //Fonction init qui permet de creer notre joueur avec un nom et une arme
    init(name : String, weapon : Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    //Fonction attaque qui prend en parametre le joueur attaque
    func toAttack(player : Character){
        player.healthPoint = player.healthPoint - self.weapon.dammage
    }
    
    //Fonction qui permet de changer d'arme si un coffre apparait
    func changeWeapon(newWeapon : Weapon){
        self.weapon = newWeapon
    }
    
    //Fonction de soin qui apparait de maniere aleatoire
    func heal(){
        self.healthPoint += 10
    }
}
