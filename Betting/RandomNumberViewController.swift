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
    
    
    @IBOutlet weak var startNumberField: UITextField!
    @IBOutlet weak var endNumberField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNumberField.text = "0"
        endNumberField.text = "100"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func pushButton(sender: AnyObject) {
            resultLabel.text = String(randomNumber(Int(startNumberField.text!)!...Int(endNumberField.text!)!))
    }

}
