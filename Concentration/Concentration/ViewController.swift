//
//  ViewController.swift
//  Concentration
//
//  Created by 徐翔 on 2018/12/2.
//  Copyright © 2018 徐翔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipsCountLabel: UILabel!
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var flipCount  = 0 {
        didSet {
            flipsCountLabel.text = "Flips:\(flipCount)"
        }
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        flipsCountLabel.numberOfLines = 0
    }

    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
    
        if let cardNumber = cardButtons.firstIndex(of: sender){
           game.chooseCart(at: cardNumber)
            updateViewFromModel()
        }else {
            print("chosen card was not in cardButtons")
        }
        
    }
    

    func updateViewFromModel()  {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatche ?
                    #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["🤡","🚑","😱","⚽️","🍫","🥝","❄️","☃️","☀️"]
    
    var emoji = [Int:String]()
    func emoji(for card:Card)-> String {
        if emoji[card.identifier] == nil ,emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}

