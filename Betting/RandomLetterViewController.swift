//
//  RandomLettersViewController.swift
//  Betting
//
//  Created by Bia Lemos on 8/19/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomLetterViewController: UIViewController {
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
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

    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    
    
    var firstLetter: Int = 0
    var lastLetter: Int = 0

    
    @IBAction func pushButton(sender: AnyObject) {
        
        self.view.endEditing(true)
        
        if let error = checkTextFieldError() {
            let alert = UIAlertController(title: "Error!", message: error, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            print("Sort Letter")
            //let range = lastLett - firstLett
            let asciiCode = randomNumber(firstLetter...lastLetter)
            var str = ""
            str.append(Character(UnicodeScalar(asciiCode)))
            resultLabel.text = str
        }
        
        self.setRandomBackgroundColor()

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
