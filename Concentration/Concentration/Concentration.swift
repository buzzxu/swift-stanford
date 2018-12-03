//
//  Concentration.swift
//  Concentration
//
//  Created by 徐翔 on 2018/12/2.
//  Copyright © 2018 徐翔. All rights reserved.
//

import Foundation

class Concentration {
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    init(numberOfPairsOfCards: Int) {
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
    
    func chooseCart(at index:Int) {
        if !cards[index].isMatche {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if(cards[matchIndex].identifier == cards[index].identifier){
                    cards[matchIndex].isMatche = true
                    cards[index].isMatche = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
