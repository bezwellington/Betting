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
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBOutlet weak var coinImage: UIImageView!

    var vWords: [String] = ["heads","tails"]
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
        case "heads":
            coinImage.image=UIImage(named: "heads")
        default:
            coinImage.image=UIImage(named: "tails")
        }

        
    }
    
    
}
