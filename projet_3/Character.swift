//
//  Character.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

public class Character {
    
    //Create the variable name wich contains the character's name. Choosen by the player
    internal var name : String
    
    //Create the variable healthPoint. Initialised by default at 40
    internal var healthPoint : Int = 40
    
    //Create the variable weapon. This variable contains the weapon choosen by the player
    var weapon : Weapon
    
    //Init function. Creates a player based on the name and a weapon
    init(name : String, weapon : Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    //Function attack with the attacked player as argument
    internal func attack(player : Character){
        player.healthPoint = player.healthPoint - self.weapon.dammage
    }
    
    //Function that allows a player to switch his  weapon
    internal func changeWeapon(newWeapon : Weapon){
        self.weapon = newWeapon
    }
 
    //Heal function with the targeted player as argument
    internal func heal(player : Character){
        self.healthPoint += 20
    }
}
