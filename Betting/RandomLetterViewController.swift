//
//  RandomLettersViewController.swift
//  Betting
//
//  Created by Bia Lemos on 8/19/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomLetterViewController: UIViewController {
    
    @IBOutlet weak var pushButton: UIButton!
    override func prefersStatusBarHidden() -> Bool { return true }
    
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    var auxRandom = -1
    
    
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
        
        print(randomColor) // printa o número do index
        
    }

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    
    var timer1 = NSTimer()
    var timer2 = NSTimer()
    
    
    var firstLetter: Int = 0
    var lastLetter: Int = 0
    
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
        
        self.view.endEditing(true)
        
        if let error = checkTextFieldError() {
            let alert = UIAlertController(title: "Error!", message: error, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            // chama a funcao startRandom a cada 0.06 segundo
            timer1 = NSTimer.scheduledTimerWithTimeInterval(0.06, target:self, selector: #selector(RandomNumberViewController.startRandom), userInfo: nil, repeats: true)
            
            // chama a funcao stopRandom a cada 0.4 segundo
            timer2 = NSTimer.scheduledTimerWithTimeInterval(0.6, target:self, selector: #selector(RandomNumberViewController.stopRandom), userInfo: nil, repeats: true)
        }
        
        self.setRandomBackgroundColor()

    }
    
    // funcao que anima a label
    func startRandom() {
        print("Sort Letter")
        //let range = lastLett - firstLett
        let asciiCode = randomNumber(firstLetter...lastLetter)
        var str = ""
        str.append(Character(UnicodeScalar(asciiCode)))
        resultLabel.text = str
        pushButton.enabled = false
    }
    
    // funcao que PARA o timer1 e timer2
    func stopRandom() {
        timer1.invalidate()
        timer2.invalidate()
        pushButton.enabled = true
    }
    
    
    // verificação de erros
    func checkTextFieldError() -> String? {
        
        //converte o caractere para padrao unicode
        if firstField.text != "" && lastField.text != "" {
        firstLetter = (firstField.text?.characters.first?.unicodeScalarCodePoint())!
        lastLetter = (lastField.text?.characters.first?.unicodeScalarCodePoint())!
        } else {
            return "Don't forget to insert the letter!"
        }

        //intervalo do alfabeto maiusculo na tabela ASCII
        let range: Range<Int> = 65...90
        
        //retorna erro de caractere que não é letra maiuscula
        if !(range.contains(firstLetter) && range.contains(lastLetter)){
            return "Please insert only letters."
        }
            
        //retorna erro de ordem errada de letras
        else if (firstLetter > lastLetter) {
            return "Please insert in alphabetical order"
        }
        
        return nil
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstField.delegate = self
        lastField.delegate = self

        textFieldStyles(firstField)
        textFieldStyles(lastField)
        
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

    

}



extension RandomLetterViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(textField: UITextField) {
        textField.text = textField.text?.uppercaseString
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        textField.text = textField.text?.uppercaseString
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= 1
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
}
