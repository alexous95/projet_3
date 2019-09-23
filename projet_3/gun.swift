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
    
    override func description(){
        super.description()
        print("Et je suis de type fusil")
    }
    

}
