//
//  ViewController.swift
//  Concentration
//
//  Created by 徐翔 on 2018/12/2.
//  Copyright © 2018 徐翔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet private weak var flipsCountLabel: UILabel!
    private var game : Concentration!
    var numberOfPairsOfCards : Int {
         return (cardButtons.count + 1) / 2
    }
    private(set) var flipCount  = 0 {
        didSet {
            flipsCountLabel.text = "Flips:\(flipCount)"
        }
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        flipsCountLabel.numberOfLines = 0
        game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    }

    
    @IBAction private  func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCart(at: cardNumber)
            updateViewFromModel()
            if game.isAllMatch() {
                let alert = UIAlertController(title:"提示框",message:"获得了\(flipCount)分，你真棒",preferredStyle:.alert)
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: {
                    _ in  (
                        self.game = Concentration(numberOfPairsOfCards: (self.cardButtons.count + 1) / 2)
                    )
                }))
                self.present(alert, animated: true, completion: nil)
                
            }
        }else {
            print("chosen card was not in cardButtons")
        }
    }

    private func updateViewFromModel()  {
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
    
    private var emojiChoices = ["🤡","🚑","😱","⚽️","🍫","🥝","❄️","☃️","☀️"]
    
    private var emoji = [Card:String]()
    private func emoji(for card:Card)-> String {
        if emoji[card] == nil ,emojiChoices.count > 0 {
            let randomIndex = emojiChoices.count.arc4random
            emoji[card] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card] ?? "?"
    }
}

extension Int {
    var arc4random : Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        }else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else {
            return 0
        }
        
    }
}

