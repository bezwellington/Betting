//
//  RandomDiceViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 15/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomDiceViewController: UIViewController {
    
    @IBOutlet weak var diceImage: UIImageView!
    
    var vWords: [String] = ["1","2","3","4","5","6"]
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
        let descriptionPhoto =  vWords[index]
        
        switch descriptionPhoto {
        case "1":
            diceImage.image=UIImage(named: "1")
        case "2":
            diceImage.image=UIImage(named: "2")
        case "3":
            diceImage.image=UIImage(named: "3")
        case "4":
            diceImage.image=UIImage(named: "4")
        case "5":
            diceImage.image=UIImage(named: "5")
        default:
            diceImage.image=UIImage(named: "6")
        }
        
    }
}
