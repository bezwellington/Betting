//
//  Extensions.swift
//  Betting
//
//  Created by Gabrielle Brandenburg dos Anjos on 8/24/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import Foundation

extension Character
{
    func unicodeScalarCodePoint() -> Int
    {
        let characterString = String(self)
        let scalars = characterString.unicodeScalars
        
        return Int(scalars[scalars.startIndex].value)
    }
}