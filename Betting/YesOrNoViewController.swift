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
    }
    
}
