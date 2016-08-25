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
        
        // add style to textfields
        func textFieldStyles(textField: UITextField) {
            
            let border = CALayer()
            let width = CGFloat(1.0)
            border.borderColor = UIColor.whiteColor().CGColor
            
            border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
            
            border.borderWidth = width
            textField.layer.addSublayer(border)
            textField.layer.masksToBounds = true
            
        }
        
        textFieldStyles(startNumberField)
        textFieldStyles(endNumberField)

    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    @IBAction func pushButton(sender: AnyObject) {
            resultLabel.text = String(randomNumber(Int(startNumberField.text!)!...Int(endNumberField.text!)!))
    }

}
