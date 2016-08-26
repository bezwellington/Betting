//
//  RandomWordsViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 16/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomWordViewController: UIViewController {
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    let screenSize = UIScreen.mainScreen().bounds
    
    
    var auxRandom = -1
    
    
    // muda as cores do background aleatoriamente
    func setRandomBackgroundColor() {
        
        let colors = [
            UIColor(red:0.94, green:0.30, blue:0.41, alpha:1.0), //red
            UIColor(red:0.23, green:0.83, blue:0.50, alpha:1.0), //green
            UIColor(red:0.99, green:0.85, blue:0.36, alpha:1.0), //yellow
            UIColor(red:0.29, green:0.75, blue:0.89, alpha:1.0), //blue
            UIColor(red:0.97, green:0.46, blue:0.64, alpha:1.0), //pink
            UIColor(red:0.67, green:0.46, blue:0.74, alpha:1.0), //purple
            UIColor(red:1.00, green:0.31, blue:0.31, alpha:1.0), //red
            UIColor(red:1.00, green:0.42, blue:0.42, alpha:1.0)  //salmon
        ]
        
        var randomColor = Int(arc4random_uniform(UInt32 (colors.count)))
        
        if auxRandom == randomColor {
            randomColor = Int(arc4random_uniform(UInt32 (colors.count)))
        } else {
            self.view.backgroundColor = colors[randomColor]
            auxRandom = randomColor
        }
        
        print(randomColor) // printa o número do index
        
    }
    
    
    @IBOutlet weak var firstOptionField: UITextField!
    @IBOutlet weak var secondOptionField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    var vWords: [String] = []
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFieldStyles(firstOptionField)
        textFieldStyles(secondOptionField)
        
        setFontSize()
        
    }
    
    
    func setFontSize() {
        
        let height = screenSize.height
        
        switch height {
        case 736: // iphone 6+
            resultLabel.font = resultLabel.font.fontWithSize(80)
            print("iphone 6+")
        case 667: // iphone 6
            resultLabel.font = resultLabel.font.fontWithSize(50)
            print("iphone 6")
        default:
            resultLabel.font = resultLabel.font.fontWithSize(39)
            print("iphone 5")
        }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    // adiciona estilo aos text fields
    func textFieldStyles(textField: UITextField) {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.whiteColor().CGColor
        
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
        
    }
    
    
//MARK: LEMBRAR DE ADICIONAR OS ALERTAS
    @IBAction func pushButton(sender: AnyObject) {
        
        if let error = checkTextFieldError() {
            let alert = UIAlertController(title: "Error!", message: error, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            
            vWords = [firstOptionField.text!, secondOptionField.text!]
            
            if (vWords.count > 1) {
                index = randomNumber(0...vWords.count-1)
                print (vWords[index])
                resultLabel.text = vWords[index]
            }
        
            self.setRandomBackgroundColor()
        }
        
    }
    
    
    func checkTextFieldError() -> String? {
        
        if firstOptionField.text == "" || secondOptionField.text == "" {
            return "Don't forget to insert the word!"
        }
        
        return nil
        
    }

}



extension RandomWordViewController: UITextFieldDelegate {
    
    // dismiss keyboard quando clicar em return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        print("TextField should return")
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
}
