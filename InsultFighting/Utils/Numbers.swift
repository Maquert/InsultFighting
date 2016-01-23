//
//  Numbers.swift
//  InsultFighting
//
//  Created by Miguel Hernández Jaso on 22/01/16.
//  Copyright © 2016 Miguel Hernández Jaso. All rights reserved.
//

import Foundation




extension Int
{
    static func random(max: Int) -> Int
    {
        let integer32 = UInt32(max)
        return Int(arc4random_uniform( integer32 ))
    }
}