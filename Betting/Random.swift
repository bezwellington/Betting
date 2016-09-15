//
//  Random.swift
//  Betting
//
//  Created by Wellington Bezerra on 17/08/16.
//  Copyright © 2016 Wellington Bezerra. All rights reserved.
//

import Foundation

func randomNumber(range: Range<Int> = 1...6) -> Int {
    
    let min = range.startIndex
    let max = range.endIndex
    return Int(arc4random_uniform(UInt32(max - min))) + min
    
}