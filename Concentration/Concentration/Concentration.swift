//
//  Concentration.swift
//  Concentration
//
//  Created by 徐翔 on 2018/12/2.
//  Copyright © 2018 徐翔. All rights reserved.
//

import Foundation

class Concentration {
    private(set) var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int? {
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
        get {
            var foundIdex : Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIdex == nil {
                        foundIdex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIdex
        }
    }
    init(numberOfPairsOfCards: Int) {
        assert(numberOfPairsOfCards > 0 ,"Concentration.init(\(numberOfPairsOfCards)): you must hava at least one pair of cards")
        for _ in 1...numberOfPairsOfCards{
            let card = Card()
            cards += [card,card]
        }
        cards.shuffle()
    }
    
    func chooseCart(at index:Int) {
        assert(cards.indices.contains(index),"Concentration.chooseCart(at:\(index):chosen index not in the cards")
        if !cards[index].isMatche {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if(cards[matchIndex] == cards[index]){
                    cards[matchIndex].isMatche = true
                    cards[index].isMatche = true
                }
                cards[index].isFaceUp = true
            } else {
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    func isAllMatch() -> Bool {
        for index in cards.indices {
            if !cards[index].isMatche {
                return false
            }
        }
        return true
    }
}
