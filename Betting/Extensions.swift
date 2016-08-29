//
//  Extensions.swift
//  Betting
//
//  Created by Gabrielle Brandenburg dos Anjos on 8/24/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import Foundation
import UIKit

extension Character
{
    func unicodeScalarCodePoint() -> Int
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return Int(scalars[scalars.startIndex].value)
    }
}

extension UIView {
    func enlargeAnimation() {
        UIView.animateWithDuration(0.2 ,
                                   animations: {
                                    self.transform = CGAffineTransformMakeScale(1.1, 1.1)
            },
                                   completion: { finish in
                                    UIView.animateWithDuration(0.2){
                                        self.transform = CGAffineTransformIdentity
                                    }
        })
    }
}

extension UIColor {
    
    class func redBet() -> UIColor{
        return UIColor(red:0.94, green:0.30, blue:0.41, alpha:1.0)
    }
    
    class func red2Bet() -> UIColor{
        return UIColor(red:0.94, green:0.31, blue:0.31, alpha:1.0)
    }
    
    class func greenBet() -> UIColor{
        return UIColor(red:0.23, green:0.83, blue:0.50, alpha:1.0)
    }
    
    class func yellowBet() -> UIColor{
        return UIColor(red:0.99, green:0.85, blue:0.36, alpha:1.0)
    }
    
    class func blueBet() -> UIColor{
        return UIColor(red:0.29, green:0.75, blue:0.89, alpha:1.0)
    }
    
    class func pinkBet() -> UIColor{
        return UIColor(red:0.97, green:0.46, blue:0.64, alpha:1.0)
    }
    
    class func purpleBet() -> UIColor{
        return UIColor(red:0.67, green:0.46, blue:0.74, alpha:1.0)
    }
    
    class func salmonBet() -> UIColor{
        return UIColor(red:1.00, green:0.42, blue:0.42, alpha:1.0)
    }
    
    class func blackBet() -> UIColor{
        return UIColor(red:0.14, green:0.14, blue:0.14, alpha:1.0)
    }
    
}