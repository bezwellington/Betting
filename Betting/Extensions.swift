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