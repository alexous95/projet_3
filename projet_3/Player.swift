//
//  Player.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

class Player {
    
    //La variable team contiendra les 3 personnages de chaques joueurs
    var team : [Character] = []
    
    
    func detailTeam(){
        for chara in team {
            print("Character's name : \(chara.name)\t Character's life \(chara.healthPoint)")
        }
        
    }
}
