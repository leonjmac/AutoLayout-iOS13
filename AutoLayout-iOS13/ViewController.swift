//
//  ViewController.swift
//  AutoLayout-iOS13
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    @IBOutlet weak var rollButton: UIButton!
    let allDice = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    @IBAction func rollButtonPressed(_ sender: Any) {
        rollButton.isEnabled = false
        
        diceImageView1.animateShake(completion: { (didComplete: Bool) in
            self.rollButton.isEnabled = didComplete
        })
        diceImageView2.animateShake(completion: { (didComplete: Bool) in
            self.rollButton.isEnabled = didComplete
        })
        diceImageView1.image = allDice[Int.random(in: 0...5)]
        diceImageView2.image = self.allDice[Int.random(in: 0...5)]
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if (motion == .motionShake) {
            self.rollButtonPressed(motion)
        }
    }
    
}

extension UIView {
    func animateShake(withOption option:UIView.AnimationOptions = .curveEaseInOut, completion: ((Bool) -> Void)?) {
        self.transform = CGAffineTransform(translationX: CGFloat(Double.random(in: -25...25)), y: CGFloat(Double.random(in: -25...25)))
        UIView.animate(withDuration: 0.54, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: completion)
    }
}
