//
//  RandomNumberViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 15/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

let color1 = UIColor(red:0.94, green:0.30, blue:0.41, alpha:1.0) //red
let color2 = UIColor(red:0.23, green:0.83, blue:0.50, alpha:1.0) //green
let color3 = UIColor(red:0.99, green:0.85, blue:0.36, alpha:1.0) //yellow
let color4 = UIColor(red:0.29, green:0.75, blue:0.89, alpha:1.0) //blue
let color5 = UIColor(red:0.97, green:0.46, blue:0.64, alpha:1.0) //pink
let color6 = UIColor(red:0.67, green:0.46, blue:0.74, alpha:1.0) //purple
let color7 = UIColor(red:1.00, green:0.31, blue:0.31, alpha:1.0) //red
let color8 = UIColor(red:1.00, green:0.42, blue:0.42, alpha:1.0)  //salmon
var colors = [color1, color2,color3,color4,color5,color6,color7,color8 ]

class RandomNumberViewController: UIViewController {
    
    @IBOutlet weak var pushButton: UIButton!
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    var lastRandomColor = 0
    var auxRandomColor = 0
    
    // muda as cores do background aleatoriamente
    func setRandomBackgroundColor() {
        
        //Vai ser finalizada JAJA!!!!
        // To garantido que nenhuma cor seja repetida
        
        colors.removeAtIndex(lastRandomColor)
        var randomColor = randomNumber(0...colors.count-2)
        self.view.backgroundColor = colors[randomColor]
        colors.append(colors[lastRandomColor]) // adicionar o que foi excluido
        lastRandomColor = randomColor

    }
    
    
    @IBOutlet weak var startNumberField: UITextField!
    @IBOutlet weak var endNumberField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    var timer1 = NSTimer()
    var timer2 = NSTimer()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNumberField.text = "0"
        endNumberField.text = "100"
        
        textFieldStyles(startNumberField)
        textFieldStyles(endNumberField)

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

    
    // verificação de erros
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
            // chama a funcao startRandom a cada 0.06 segundo
            timer1 = NSTimer.scheduledTimerWithTimeInterval(0.06, target:self, selector: Selector("startRandom"), userInfo: nil, repeats: true)
            
            // chama a funcao stopRandom a cada 0.4 segundo
            timer2 = NSTimer.scheduledTimerWithTimeInterval(0.4, target:self, selector: Selector("stopRandom"), userInfo: nil, repeats: true)
            
            self.setRandomBackgroundColor()
        }
        
    }
    
    // funcao que anima a label
    func startRandom() {
        resultLabel.text = String(randomNumber(Int(startNumberField.text!)!...Int(endNumberField.text!)!))
    }
    
    // funcao que PARA o timer1 e timer2
    func stopRandom() {
        timer1.invalidate()
        timer2.invalidate()
    }
    
    // dismiss keyboard quando clica fora
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    
}
