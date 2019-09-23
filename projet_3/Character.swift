//
//  Character.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

class Character {
    var name : String
    var healthPoint : Int = 100
    var weapon : Weapon
    
    init(name : String, weapon : Weapon) {
        self.name = name
        self.weapon = weapon
    }
    
    func toAttack(player : Character){
        player.healthPoint = player.healthPoint - self.weapon.dammage
    }
    
    func changeWeapon(newWeapon : Weapon){
        self.weapon = newWeapon
    }
    
    func heal(){
        self.healthPoint += 10
    }
}
