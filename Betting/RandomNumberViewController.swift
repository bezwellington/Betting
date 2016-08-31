//
//  RandomNumberViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 15/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomNumberViewController: UIViewController {
    
    @IBOutlet weak var pushButton: UIButton!
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    var auxRandom = -1
    var newRandomColor = 0
    var lastRandomColor = 0
    var colors = [
        UIColor.redBet(),
        UIColor.greenBet(),
        UIColor.yellowBet(),
        UIColor.blueBet(),
        UIColor.pinkBet(),
        UIColor.purpleBet(),
        UIColor.red2Bet(),
        UIColor.salmonBet()
    ]

    
    // muda as cores do background aleatoriamente
    func setRandomBackgroundColor() {
/*
        // To garantido que nenhuma cor seja repetida
        colors.removeAtIndex(newRandomColor)
        var randomColor = randomNumber(0...colors.count-2)
        self.view.backgroundColor = colors[randomColor]
        lastRandomColor = newRandomColor
        newRandomColor = randomColor
        colors.append(colors[lastRandomColor]) // adicionar o que foi excluido
 */
        var randomColor = randomNumber(0...colors.count-1)
        
        if auxRandom == randomColor {
            var randomColor = randomNumber(0...colors.count-1)
            self.view.backgroundColor = colors[randomColor]
            auxRandom = randomColor
        } else {
            self.view.backgroundColor = colors[randomColor]
            auxRandom = randomColor
        }
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
            timer1 = NSTimer.scheduledTimerWithTimeInterval(0.06, target:self, selector: #selector(RandomNumberViewController.startRandom), userInfo: nil, repeats: true)
            
            // chama a funcao stopRandom a cada 0.4 segundo
            timer2 = NSTimer.scheduledTimerWithTimeInterval(0.6, target:self, selector: #selector(RandomNumberViewController.stopRandom), userInfo: nil, repeats: true)
            
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
