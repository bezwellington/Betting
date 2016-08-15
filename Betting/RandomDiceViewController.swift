//
//  RandomDiceViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 15/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomDiceViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

}
