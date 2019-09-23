//
//  Weapon.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

class Weapon {
    // MARK: - VARIABLES
    
    //On crée une variable de int qui contiendra les degats qu'infligera l'arme
    var dammage : Int
    
    //La fonction Init qui initialise notre classe 
    init(dammage : Int){
        self.dammage = dammage
    }
    
    func description(){
        print("Je suis une arme")
    }
    
}
