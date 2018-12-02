//
//  Card.swift
//  Concentration
//
//  Created by 徐翔 on 2018/12/2.
//  Copyright © 2018 徐翔. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatche = false
    var identifier: Int
    static var identifierFactory = 0
    static func getUniqueIdentifier()->Int {
        identifierFactory += 1
        return identifierFactory
    }
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
}
