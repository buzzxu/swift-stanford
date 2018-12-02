//
//  ViewController.swift
//  Concentration
//
//  Created by 徐翔 on 2018/12/2.
//  Copyright © 2018 徐翔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var game = Concentration(numberOfPairsOfCards: 6)
    var flipCount  = 0 {
        didSet {
            flipsCountLabel.text = "Flips:\(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipsCountLabel: UILabel!
    var emojiChoices = ["🤡","👻","👻","🤡"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender){
            filpCard(withEmoji: emojiChoices[cardNumber], on: sender)
        }
        
    }
    

    
    func filpCard(withEmoji emoji:String,on button:UIButton){
        print("filpCard(withEmoji: \(emoji))")
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        }else{
            button.setTitle(emoji, for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
}

