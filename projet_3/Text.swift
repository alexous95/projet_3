//
//  Text.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 10/10/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

class Text {
  
  static var descriptionWeapon : [String] {
    return ["Choose the weapon you want"]
  }
  
  static var choiceWeapon : [String] {
    return ["Sword", "Gun"]
  }
  
  static var wrongWeapon : [String] {
    return ["Error, you chose a wrong number", "Enter a valid number"]
  }
  
  static var wrongName : [String] {
    return ["This name has already been choosen", "Enter a new name"]
  }
  
  static var descriptionCharacter : [String]{
    return ["Choose a character"]
  }
  
  static var wrongCharacter : [String] {
    return ["Bad choice", "Choose a valid number for the character"]
  }
  
  static var actionDescription : [String] {
    return ["What do you want to do ?"]
  }
  
  static var actionChoice : [String] {
    return ["Attack", "Heal"]
  }
  
  static var wrongAction : [String] {
    return ["Wrong choice", "Choose a valid action"]
  }
  
  static var playerChoiceDescription : [String] {
    return ["Choose the ennemy player you want to fight"]
  }
  
  static var wrongPlayer : [String] {
    return ["Wrong choice", "Choose a valid player"]
  }
  
  
}
