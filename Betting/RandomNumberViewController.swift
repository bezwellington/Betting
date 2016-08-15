//
//  RandomNumberViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 15/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomNumberViewController: UIViewController {
    
    @IBOutlet weak var startNumberLabel: UITextField!
    @IBOutlet weak var endNumberLabel: UITextField!
    @IBOutlet weak var resultLabel: UILabel!

    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomNumber(range: Range<Int> = 1...6) -> Int {
        let min = range.startIndex
        let max = range.endIndex
        return Int(arc4random_uniform(UInt32(max - min))) + min
    }

    @IBAction func randomButton(sender: AnyObject) {
            resultLabel.text = String(randomNumber(Int(startNumberLabel.text!)!...Int(endNumberLabel.text!)!))
    }

    @IBAction func resetTextFields(sender: AnyObject) {
        startNumberLabel.text = ""
        endNumberLabel.text = ""
        resultLabel.text = ""
        
    }
}
