//
//  Card.swift
//  Concentration
//
//  Created by 徐翔 on 2018/12/2.
//  Copyright © 2018 徐翔. All rights reserved.
//

import Foundation

struct Card : Hashable{
    
    
    var hashValue: Int {return identifier}
    

    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatche = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    private static func getUniqueIdentifier()->Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
    
    
}
