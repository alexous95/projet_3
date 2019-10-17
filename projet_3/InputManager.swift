//
//  InputManager.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 26/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

public class InputManager {
  
  static let shared = InputManager()
  
  private init(){}
  
  /// This function is used to read input from users and return a Int
  private func inputInt() -> Int {
    let readData = readLine()
    
    if let data = readData {
      if let intData = Int(data){
        return intData
      }
    }
    return -1
  }
  
  /// This function is used to read input from users and return a String
  private func inputStr() -> String {
    let readData = readLine()
    if let data = readData {
      return data
    }
    return "We have a problem"
  }
  
  /// This function is used to read the user input when a string is expected. As parameters we have 3 arrays of string that describe the different choices
  func askStr(descriptionParameters: [String], choiceParameters: [String]?, wrongDescription: [String], stringArray: inout [String]) -> String {
    var resultString = ""
    var i = 0
    for description in descriptionParameters {
      print(description)
    }
    
    if let choiceParametres = choiceParameters {
      for parametres in choiceParametres {
        i += 1
        print("\(i).\(parametres)")
      }
    }
    
    resultString = inputStr()
    
    while (checkStrValue(in: &stringArray, value: resultString) == true) {
      for wrong in wrongDescription {
        print(wrong)
      }
      resultString = inputStr()
    }
    
    return resultString
  }
  
  /// This function checks if a value is inside an array of String
  func checkStrValue(in array: inout [String], value: String) -> Bool {
    if array.contains(value) {
      return true
    }
    return false
  }
  
  /// This function checks if a value is inside an array of Int
  func checkIntValue(in array: [Int], value: Int) -> Bool {
    for i in array {
      if value == i {
        return true
      }
    }
    return false
  }
  
  /// This function is used when we ask a user for an Int
  func askInt(descriptionParameters: [String], choiceParameters: [String]?, wrongDescription: [String], valueAccepted: [Int]) -> Int {
    var result : Int = 0
    var i = 0
    for descrption in descriptionParameters {
      print(descrption)
    }
    if let choiceParameters = choiceParameters {
      for parameter in choiceParameters {
        i += 1
        print("\(i).\(parameter)")
      }
    }
    result = inputInt()
    print("")
    
    while(checkIntValue(in: valueAccepted, value: result) == false) {
      for description in wrongDescription {
        print(description)
      }
      result = inputInt()
      print("")
      
    }
    return result
  }
  
  /// This function is used when the user is asked to choose a weapon
  func askWeapon(descriptionParameters: [String], choiceParameters: [String]?, wrongDescription: [String], valueAccepted: [Int]) -> WeaponType {
    var result: Int = 0
    var i = 0
    var weaponType: WeaponType = .sword
    
    for descrption in descriptionParameters{
      print(descrption)
    }
    if let choiceParameters = choiceParameters{
      for parameter in choiceParameters{
        i += 1
        print("\(i).\(parameter)")
      }
    }
    result = inputInt()
    print("")
    
    while(checkIntValue(in: valueAccepted, value: result) == false) {
      for description in wrongDescription {
        print(description)
      }
      result = inputInt()
      print("")
      
    }
    switch result {
    case 1:
      weaponType = .sword
    case 2:
      weaponType = .gun
    default:
      break
    }
    return weaponType
  }
  
  
  /// This function is used when the user is asked to choose an action
  func askAction(descriptionParameters: [String], choiceParameters : [String]? = nil, wrongDescription: [String], valueAccepted: [Int]) -> PlayerActions  {
    var result : Int = 0
    var i = 0
    var actionType: PlayerActions = .attack
    
    for description in descriptionParameters {
      print(description)
    }
    if let choiceParameters = choiceParameters {
      for parameter in choiceParameters{
        i += 1
        print("\(i).\(parameter)")
      }
    }
    result = inputInt()
    print("")
    
    while(checkIntValue(in: valueAccepted, value: result) == false){
      for description in wrongDescription {
        print(description)
      }
      result = inputInt()
      print("")
      
    }
    switch result {
    case 1:
      actionType = .attack
    case 2:
      actionType = .heal
    default:
      break
    }
    return actionType
  }
  
  /// This function is used when the users is asked to choose a player
  func askPlayer(descriptionParameters: [String], choiceParameters: [String]?, wrongDescription: [String], valueAccepted: [Int], playersArray: [Player]) -> Player  {
    
    var result: Int = 0
    var i = 0
    
    for description in descriptionParameters {
      print(description)
    }
    if let choiceParameters = choiceParameters {
      for parameter in choiceParameters{
        i += 1
        print("\(i).\(parameter)")
      }
    }
    result = inputInt()
    print("")
    
    while(checkIntValue(in: valueAccepted, value: result) == false) {
      for description in wrongDescription {
        print(description)
      }
      result = inputInt()
      print("")
    }
    return playersArray[result - 1]
  }
}
