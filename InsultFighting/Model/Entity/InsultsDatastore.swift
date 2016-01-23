//
//  InsultDatastore.swift
//  InsultFighting
//
//  Created by Miguel Hernández Jaso on 22/01/16.
//  Copyright © 2016 Miguel Hernández Jaso. All rights reserved.
//

import Foundation




class InsultsDatastore
{
    // MARK: Attributes
    private var insults: [Insult]
    
    
    
    
    // MARK: Init
    init()
    {
        self.insults = InsultsProvider.retrieveInsults()
    }
    
    
    
    
    // MARK: Public
    
    func randomInsult() -> Insult
    {
        let randomNumber = Int.random(self.insults.count)
        let insult = self.insults[randomNumber]
        self.insults.removeAtIndex(randomNumber)
        return insult
    }
    
    
    
    // MARK: Private
    
}

