//
//  RandomLettersViewController.swift
//  Betting
//
//  Created by Bia Lemos on 8/19/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomLetterViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var firstField: UITextField!
    @IBOutlet weak var lastField: UITextField!
    let limitLength = 1
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstField.delegate = self
        lastField.delegate = self
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return true }
        let newLength = text.characters.count + string.characters.count - range.length
        return newLength <= limitLength
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
