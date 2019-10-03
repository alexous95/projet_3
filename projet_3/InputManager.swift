//
//  InputManager.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 26/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

class InputManager {
    
    func inputInt() -> Int {
        let readData = readLine()
        
        if let dataInt = readData {
            return Int(dataInt)!
        }
        return 0
    }
    
    func inputStr() -> String {
        let readData = readLine()
        if let data = readData {
            return data
        }
        return "We have a problem"
    }
    
    func askStr(descriptionParameters : [String], choiceParametres : [String]?, wrongDescription : [String], stringArray : inout [String]) -> String{
        var resultString = ""
        var i = 0
        for description in descriptionParameters {
            print(description)
        }
        
        if let choiceParametres = choiceParametres {
            for parametres in choiceParametres {
                i += 1
                print("\(i).\(parametres)")
            }
        }
        resultString = inputStr()
        
        while (checkStrValue(in: &stringArray, value: resultString) == false) {
            for wrong in wrongDescription {
                print(wrong)
            }
            resultString = inputStr()
        }
        
        return resultString
    }
    
    private func checkStrValue(in array : inout [String], value : String) -> Bool{
        if array.contains(value){
            return true
        }
        return false
    }
    
    private func checkIntValue(in array : [Int], value : Int) -> Bool{
        for i in array{
            if value == i{
                return true
            }
        }
        return false
    }
    
    func askInt(descriptionParameters : [String], choiceParametres : [String]?, wrongDescription : [String], valueAccepted : [Int]) -> Int{
        var result : Int = 0
        var i = 0
        for descrption in descriptionParameters{
            print(descrption)
        }
        if let choiceParametres = choiceParametres{
            for parametre in choiceParametres{
                i += 1
                print("\(i).\(parametre)")
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
        return result
    }
}
