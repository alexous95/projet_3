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
}
