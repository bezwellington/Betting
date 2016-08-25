//
//  RandomLettersViewController.swift
//  Betting
//
//  Created by Bia Lemos on 8/19/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomLetterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    var firstLett: Int = 0
    var lastLett: Int = 0
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func randomButton(sender: AnyObject) {
        self.view.endEditing(true)
        
        if let error = checkTextFieldError() {
            let alert = UIAlertController(title: "Error!", message: error, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            print("Sort Letter")
            //let range = lastLett - firstLett
            let asciiCode = randomNumber(firstLett...lastLett)
            var str = ""
            str.append(Character(UnicodeScalar(asciiCode)))
            resultLabel.text = str
        }

    }
    
    func checkTextFieldError() -> String? {
        //converte o caractere para padrao unicode
        
        if firstField.text != "" && lastField.text != "" {
        firstLett = (firstField.text?.characters.first?.unicodeScalarCodePoint())!
        lastLett = (lastField.text?.characters.first?.unicodeScalarCodePoint())!
        } else {
            return "Don't forget to insert the letter!"
        }
        
        //intervalo do alfabeto maiusculo na tabela ASCII
        let range: Range<Int> = 65...90
        
        //retorna erro de caractere que não é letra maiuscula
        if !(range.contains(firstLett) && range.contains(lastLett)){
            return "Please insert only letters."
        }
        //retorna erro de ordem errada de letras
        else if (firstLett > lastLett) {
            return "Please insert in alphabetical order."
        }
        
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstField.delegate = self
        lastField.delegate = self
    }
    
    //textField delegate metods:
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
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
