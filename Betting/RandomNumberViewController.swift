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

    
    func setRandomBackgroundColor() {
        
        let colors = [
            UIColor(red:0.94, green:0.30, blue:0.41, alpha:1.0), //red
            UIColor(red:0.23, green:0.83, blue:0.50, alpha:1.0), //green
            UIColor(red:0.99, green:0.85, blue:0.36, alpha:1.0), //yellow
            UIColor(red:0.29, green:0.75, blue:0.89, alpha:1.0), //blue
            UIColor(red:0.97, green:0.46, blue:0.64, alpha:1.0), //pink
            UIColor(red:0.67, green:0.46, blue:0.74, alpha:1.0), //purple
            UIColor(red:1.00, green:0.31, blue:0.31, alpha:1.0), //red
            UIColor(red:1.00, green:0.42, blue:0.42, alpha:1.0) //salmon
        ]
        
        let randomColor = Int(arc4random_uniform(UInt32 (colors.count)))
        self.view.backgroundColor = colors[randomColor]
        
    }
    
    
    @IBOutlet weak var startNumberField: UITextField!
    @IBOutlet weak var endNumberField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNumberField.text = "0"
        endNumberField.text = "100"
        
        // add style to textfields
        
        textFieldStyles(startNumberField)
        textFieldStyles(endNumberField)

    }

    func textFieldStyles(textField: UITextField) {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func checkTextFieldError() -> String? {
        
        if startNumberField.text == "" || endNumberField.text == "" {
            return "Don't forget to insert the number!"
        }
            
        //retorna erro de ordem errada de letras
        else if Int(startNumberField.text!) > Int(endNumberField.text!) {
            return "Please insert in ascending order."
        }
        
        return nil
        
    }
    
    @IBAction func pushButton(sender: AnyObject) {
        
        if let error = checkTextFieldError() {
            
            let alert = UIAlertController(title: "Error!", message: error, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)

        } else {
            
            resultLabel.text = String(randomNumber(Int(startNumberField.text!)!...Int(endNumberField.text!)!))
            self.setRandomBackgroundColor()
        }
        
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
}
