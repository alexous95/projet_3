//
//  Gun.swift
//  projet_3
//
//  Created by Alexandre Goncalves on 23/09/2019.
//  Copyright © 2019 Alexandre Goncalves. All rights reserved.
//

import Foundation

public class Gun: Weapon {
  
  init(){
    super.init(dammage: 7)
  }
  
  /// Init function used for the randomly created weapons
  init(newDammage: Int) {
    super.init(dammage: newDammage)
  }
  
  override func description() {
    print("I am a gun and i deal \(self.dammage) dammage")
  }
  
  
}
