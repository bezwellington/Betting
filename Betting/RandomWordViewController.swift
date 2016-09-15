//
//  RandomWordsViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 16/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomWordViewController: UIViewController {
    
    @IBOutlet weak var pushButton: UIButton!
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    let screenSize = UIScreen.mainScreen().bounds
    var auxRandom = -1
    var timer1 = NSTimer()
    var timer2 = NSTimer()
    
    
    // muda as cores do background aleatoriamente
    func setRandomBackgroundColor() {
        
        let colors = [
            UIColor.redBet(),
            UIColor.greenBet(),
            UIColor.yellowBet(),
            UIColor.blueBet(),
            UIColor.pinkBet(),
            UIColor.purpleBet(),
            UIColor.red2Bet(),
            UIColor.salmonBet()
        ]
        
        var randomColor = Int(arc4random_uniform(UInt32 (colors.count)))
        
        if auxRandom == randomColor {
            randomColor = Int(arc4random_uniform(UInt32 (colors.count)))
        } else {
            self.view.backgroundColor = colors[randomColor]
            auxRandom = randomColor
        }
        
        print(randomColor) // printa o numero do index
        
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

    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            pushButton(pushButton)
            print("SHAKEN!!!")
        }
    }

    @IBAction func pushButton(sender: AnyObject) {
        
        if let error = checkTextFieldError() {
            let alert = UIAlertController(title: "Error!", message: error, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            
            vWords = [firstOptionField.text!, secondOptionField.text!]

/*
            if (vWords.count > 1) {
                // chama a func startRandom a cada 0.06 segundo
                timer1 = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector: #selector(RandomNumberViewController.startRandom), userInfo: nil, repeats: true)
                
                // chama a func stopRandom a cada 0.4 segundo
                timer2 = NSTimer.scheduledTimerWithTimeInterval(1.0, target:self, selector: #selector(RandomNumberViewController.stopRandom), userInfo: nil, repeats: true)
            }
*/
            startRandom()
            resultLabel.enlargeAnimation()
            self.setRandomBackgroundColor()
            
        }
        
    }
    
    
    // func que anima a label
    func startRandom() {
        index = randomNumber(0...vWords.count-1)
        print (vWords[index])
        resultLabel.text = vWords[index]
        pushButton.enabled = false
    }
    
    // func que PARA o timer1 e timer2
    func stopRandom() {
        timer1.invalidate()
        timer2.invalidate()
        pushButton.enabled = true
    }
    
    
    func checkTextFieldError() -> String? {
        
        if firstOptionField.text == "" || secondOptionField.text == "" {
            return "Don't forget to insert the words!"
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
