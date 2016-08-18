//
//  RandomHeadsOrTailsViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 17/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomHeadsOrTailsViewController: UIViewController {
    
    
    @IBOutlet weak var bgImage: UIImageView!

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
            bgImage.image=UIImage(named: "baby")
        default:
            bgImage.image=UIImage(named: "happy")
        }
        
    }
    
    
}
