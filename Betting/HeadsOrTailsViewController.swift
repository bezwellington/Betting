//
//  RandomHeadsOrTailsViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 17/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class HeadsOrTailsViewController: UIViewController {
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    

    @IBOutlet weak var coinImage: UIImageView!

    var vWords: [String] = ["baby","happy"]
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func resultButton(sender: AnyObject) {
        

        
        index = randomNumber(0...vWords.count-1)
        let descriptionPhoto =  vWords[index]
        
        switch descriptionPhoto {
        case "baby":
            coinImage.image=UIImage(named: "baby")
        default:
            coinImage.image=UIImage(named: "happy")
        }

        
    }
    
    
}
