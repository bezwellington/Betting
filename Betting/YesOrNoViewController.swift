//
//  RandomYesOrNoViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 17/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class YesOrNoViewController: UIViewController {
    
    @IBOutlet weak var askButton: UIButton!
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    let screenSize = UIScreen.mainScreen().bounds
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var answerWords: [String] = ["YES!","NO!"]
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setFontSize()
        
    }
    
    func setFontSize() {
        
        let height = screenSize.height
        
        switch height {
        case 736: // iphone 6+
            resultLabel.font = resultLabel.font.fontWithSize(100)
            print("iphone 6+")
        case 667: // iphone 6
            resultLabel.font = resultLabel.font.fontWithSize(70)
            print("iphone 6")
        default:
            resultLabel.font = resultLabel.font.fontWithSize(49)
            print("iphone 5")
        }
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            askButton(askButton)
            print("SHAKEN!!!")
        }
    }

    
    @IBAction func askButton(sender: AnyObject) {
        index = randomNumber(0...answerWords.count-1)
        resultLabel.text = answerWords[index]
        
        
        // changes background color according to result label's text
        switch resultLabel.text! {
        case "YES!":
            view.backgroundColor = UIColor.greenBet()
        case "NO!":
            view.backgroundColor = UIColor.red2Bet()
        default:
            view.backgroundColor = UIColor.blackBet()
        }
        
        resultLabel.enlargeAnimation()
    }
    

    
}
