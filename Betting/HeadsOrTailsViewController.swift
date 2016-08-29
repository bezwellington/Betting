//
//  RandomHeadsOrTailsViewController.swift
//  Betting
//
//  Created by Wellington Bezerra on 17/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import UIKit
import AVFoundation

class HeadsOrTailsViewController: UIViewController {
    
    @IBOutlet weak var flipButton: UIButton!
    
    override func prefersStatusBarHidden() -> Bool { return true }
    
    
    @IBAction func closeButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBOutlet weak var coinImage: UIImageView!

    
    var vWords: [String] = ["heads","tails"]
    var index = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func canBecomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        if motion == .MotionShake {
            flipButton(flipButton)
            print("SHAKEN!!!")
        }
    }
    

    @IBAction func flipButton(sender: AnyObject) {

        index = randomNumber(0...vWords.count-1)
        let descriptionPhoto = vWords[index]
        
        playSound()
        
        // changes background color according to photo
        switch descriptionPhoto {
        case "heads":
            coinImage.image = UIImage(named: "heads")
            view.backgroundColor = UIColor.blueBet()
        case "tails":
            coinImage.image = UIImage(named: "tails")
            view.backgroundColor = UIColor.salmonBet()
        default:
            view.backgroundColor = UIColor.blackBet()
        }
        
        coinImage.enlargeAnimation()
        
    }
    
    var player: AVAudioPlayer?
    
    func playSound() {
        let url = NSBundle.mainBundle().URLForResource("coinFlip", withExtension: "wav")!
        
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
