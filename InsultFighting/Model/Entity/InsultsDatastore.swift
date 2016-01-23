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
    
    
    //MARK: Errors
    enum InsultDatastoreError: ErrorType {
        case NoInsultsFound
    }
    
    
    // MARK: Init
    init()
    {
        self.insults = InsultsProvider.retrieveInsults()
    }
    
    
    
    
    // MARK: Public
    
    // Gets a random insults and removes it from the array
    func randomInsult(removeAfterUse:Bool = true) throws -> Insult
    {
        guard self.insults.count != 0 else {
            throw InsultDatastoreError.NoInsultsFound
        }
        
        let randomNumber = Int.random(self.insults.count)
        let insult = self.insults[randomNumber]
        if removeAfterUse { self.insults.removeAtIndex(randomNumber) }
        return insult
    }
    
    
    func numberOfInsults() -> Int
    {
        return self.insults.count
    }
    
}

