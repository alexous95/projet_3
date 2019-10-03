//
//  Weapon.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

public class Weapon {
    
    //Variable which hold the dammage of the weapon
    var dammage : Int
    
    //Init function wich initialize our weapon
    init(dammage : Int){
        self.dammage = dammage
    }
    
    func description(){
        print("I'm a weapon")
    }
    
}
