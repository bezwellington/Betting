//
//  RandomDiceViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 15/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit
import AVFoundation

class RollADiceViewController: UIViewController {
    
    override func prefersStatusBarHidden() -> Bool { return true }
    @IBOutlet weak var rollButton: UIButton!
    
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBOutlet weak var diceImage: UIImageView!
    
    
    var vWords: [String] = ["1","2","3","4","5","6"]
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            rollButton(rollButton)
            print("SHAKEN!!!")
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func rollButton(sender: AnyObject) {
        
        index = randomNumber(0...vWords.count-1)
        let descriptionPhoto =  vWords[index]
        
        playSound()
        
        switch descriptionPhoto {
        case "1":
            diceImage.image = UIImage(named: "one")
            view.backgroundColor = UIColor(red:0.94, green:0.30, blue:0.41, alpha:1.0) //red
        case "2":
            diceImage.image = UIImage(named: "two")
            view.backgroundColor = UIColor(red:0.23, green:0.83, blue:0.50, alpha:1.0) //green
        case "3":
            diceImage.image = UIImage(named: "three")
            view.backgroundColor = UIColor(red:0.99, green:0.85, blue:0.36, alpha:1.0) //yellow
        case "4":
            diceImage.image = UIImage(named: "four")
            view.backgroundColor = UIColor(red:0.29, green:0.75, blue:0.89, alpha:1.0) //blue
        case "5":
            diceImage.image = UIImage(named: "five")
            view.backgroundColor = UIColor(red:0.97, green:0.46, blue:0.64, alpha:1.0) //pink
        default:
            diceImage.image = UIImage(named: "six")
            view.backgroundColor = UIColor(red:0.67, green:0.46, blue:0.74, alpha:1.0) //purple
        }
        
        diceImage.enlargeAnimation()
    }
    
    var player: AVAudioPlayer?
    
    func playSound() {
        let url = NSBundle.mainBundle().URLForResource("diceSound", withExtension: "mp3")!
        
        do {
            player = try AVAudioPlayer(contentsOfURL: url)
            guard let player = player else { return }
            
            player.prepareToPlay()
            player.play()
        } catch let error as NSError {
            print(error.description)
        }
    }
    
    
}
