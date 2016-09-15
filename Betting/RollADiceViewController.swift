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
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBOutlet weak var rollButton: UIButton!
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
            view.backgroundColor = UIColor.redBet()
        case "2":
            diceImage.image = UIImage(named: "two")
            view.backgroundColor = UIColor.greenBet()
        case "3":
            diceImage.image = UIImage(named: "three")
            view.backgroundColor = UIColor.yellowBet()
        case "4":
            diceImage.image = UIImage(named: "four")
            view.backgroundColor = UIColor.blueBet()
        case "5":
            diceImage.image = UIImage(named: "five")
            view.backgroundColor = UIColor.pinkBet()
        default:
            diceImage.image = UIImage(named: "six")
            view.backgroundColor = UIColor.purpleBet()
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
