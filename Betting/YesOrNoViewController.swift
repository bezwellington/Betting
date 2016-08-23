//
//  RandomYesOrNoViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 17/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class YesOrNoViewController: UIViewController {
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var answerWords: [String] = ["YES!","NO!"]
    var index = 0

    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func askButton(sender: AnyObject) {
        index = randomNumber(0...answerWords.count-1)
        resultLabel.text = answerWords[index]
        
        
        // changes background color according to result label's text
        switch resultLabel.text! {
        case "YES!":
            view.backgroundColor = UIColor(red:0.23, green:0.83, blue:0.50, alpha:1.0) //green
        case "NO!":
            view.backgroundColor = UIColor(red:1.00, green:0.31, blue:0.31, alpha:1.0) //red
        default:
            view.backgroundColor = UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0) //black
        }
    }
    

    
}
