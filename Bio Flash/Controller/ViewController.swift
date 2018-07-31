//
//  ViewController.swift
//  Bio Flash
//
//  Created by Kristopher Manceaux on 7/30/18.
//  Copyright © 2018 Kristopher Manceaux. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cardIndex = 0
    let stack = CardStack()
    var onWelcomeCard = true
    var answershown = false
    let endMsg = "You've reached the end.\nTap to start from the top."
    let welcomeMsg = "Tap here to begin"
    
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var welcomeText: UITextView!
    @IBOutlet weak var cardAnswerLabel: UILabel!
    @IBOutlet weak var cardProperties: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func cardButton(_ sender: Any) {
        
        // if we are on the intro card
        if(onWelcomeCard){
             // switch to the first card of the stack and keep the answer hidden
            cardProperties.setTitle(stack.cards[cardIndex].question, for: UIControlState.normal)
            onWelcomeCard = false
        }
        // else if we are on the first card of the stack and the answer is hidden
        else if(onWelcomeCard == false && !answershown && cardIndex < stack.cards.count){
            // show the answer card
            cardAnswerLabel.text = stack.cards[cardIndex].answer
            cardAnswerLabel.isHidden = false
            answershown = true
            cardIndex+=1
        }
        // else if the answer has been revealed
        else if(answershown && cardIndex < stack.cards.count){
            // switch to the next card and hide the answer for the new card
            cardProperties.setTitle(stack.cards[cardIndex].question, for: UIControlState.normal)
            cardAnswerLabel.isHidden = true
            answershown = false
            
        }
        else{
            let alert = UIAlertController(title: "End of deck", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "Restart", style: .default, handler: { _ in
                self.cardIndex = 0
                self.cardProperties.setTitle(self.welcomeMsg, for: UIControlState.normal)
                self.cardAnswerLabel.isHidden = true
                self.answershown = false
                self.onWelcomeCard = true
                
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
//            cardProperties.setTitle(endMsg, for: UIControlState.normal)
//            cardAnswerLabel.isHidden = true
//            answershown = false
//            onWelcomeCard = true
//            cardIndex = 0
        }

    }
    
    
    @IBAction func viewCardsButton(_ sender: Any) {
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
