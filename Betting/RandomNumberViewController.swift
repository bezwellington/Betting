//
//  RandomNumberViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 15/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomNumberViewController: UIViewController {
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var startNumberLabel: UITextField!
    @IBOutlet weak var endNumberLabel: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func randomButton(sender: AnyObject) {
            resultLabel.text = String(randomNumber(Int(startNumberLabel.text!)!...Int(endNumberLabel.text!)!))
    }

    @IBAction func resetTextFields(sender: AnyObject) {
        startNumberLabel.text = ""
        endNumberLabel.text = ""
        resultLabel.text = ""
        
    }
}
