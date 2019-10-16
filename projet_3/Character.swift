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
    player.healthPoint = player.healthPoint - weapon.dammage
  }
  
  //Function that allows a player to switch his  weapon
  private func changeWeapon(newWeapon : Weapon){
    weapon = newWeapon
  }
  
  private func createRandomWeapon() -> Weapon {
    let randomWeapon = Int.random(in: 1...100)
    
    if randomWeapon % 2 == 0 {
      let sword = Sword(newDammage: Int.random(in: 20...45))
      return sword
    }
    else {
      let gun = Gun(newDammage: Int.random(in: 20...45))
      return gun
    }
    
  }
  
  //This function is used to ask if the character would like to change his weapon with the one in the chest
  internal func askChangeWeapon(){
    let newWeapon = createRandomWeapon()
    
    print("A chest has appeared")
    let pickAction = InputManager.shared.askInt(descriptionParameters: Text.changeDescription, choiceParametres: Text.changeAction, wrongDescription: Text.wrongChange, valueAccepted: [1, 2])
    if pickAction == 1 {
      changeWeapon(newWeapon: newWeapon)
      newWeapon.description()
    }
  }
  
  //Heal function with the targeted player as argument
  internal func heal(player : Character){
    healthPoint += 20
  }
}
