//
//  RandomLettersViewController.swift
//  Betting
//
//  Created by Bia Lemos on 8/19/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomLetterViewController: UIViewController, UITextFieldDelegate {
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    // dismiss keyboard quando clicar em return
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print("TextField should return")
        return true
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

    }
    
    
    func checkTextFieldError() -> String? {
        
        //converte o caractere para padrao unicode
        firstLetter = (firstField.text?.characters.first?.unicodeScalarCodePoint())!
        lastLetter = (lastField.text?.characters.first?.unicodeScalarCodePoint())!
        
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
        
        textFieldStyles(firstField)
        textFieldStyles(lastField)
        
    }
    
    
    func textFieldDidEndEditing(textField: UITextField) {
         textField.text = textField.text?.uppercaseString
    }
    
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        textField.text = textField.text?.uppercaseString
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
