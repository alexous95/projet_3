//
//  Gun.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

class Gun : Weapon {
    
    init(){
        super.init(dammage: 7)
    }
    
    init(newDammage : Int){
        super.init(dammage: newDammage)
    }
    
    override func description(){
        super.description()
        print("Je suis de type fusil et j'inflige \(self.dammage) dégats")
    }
    

}
