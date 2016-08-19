//
//  RandomYesOrNoViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 17/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomYesOrNoViewController: UIViewController {
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var vWords: [String] = ["SIM","NÃO"]
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func randomButton(sender: AnyObject) {
        index = randomNumber(0...vWords.count-1)
        resultLabel.text = vWords[index]
    }
    
}
