//
//  Sword.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

class Sword : Weapon {
   
    init(){
        super.init(dammage: 40)
    }
    
    init(newDammage : Int){
        super.init(dammage: newDammage)
    }
    
    override func description(){
        super.description()
        print("I am a sword and i deal \(self.dammage) dammage")
    }
    
    
}
