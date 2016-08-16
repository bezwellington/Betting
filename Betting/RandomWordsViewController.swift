//
//  RandomWordsViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 16/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit

class RandomWordsViewController: UIViewController {

    @IBOutlet weak var newWordLabel: UITextField!
    @IBOutlet weak var randomWordLabel: UILabel!
    
    var vWords: [String] = []
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButton(sender: AnyObject) {
        vWords.append(newWordLabel.text!)
        newWordLabel.text = ""
    }

    @IBAction func randomButton(sender: AnyObject) {
        index = randomNumber(0...vWords.count)
        randomWordLabel.text = vWords[index]
    }
    
    @IBAction func cleanButton(sender: AnyObject) {
        vWords.removeAll()
        randomWordLabel.text = ""
    }
    
    func randomNumber(range: Range<Int> = 1...6) -> Int {
        let min = range.startIndex
        let max = range.endIndex
        return Int(arc4random_uniform(UInt32(max - min))) + min
    }
    
}
