//
//  ComebacksDatastore.swift
//  InsultFighting
//
//  Created by Miguel Hernández Jaso on 22/01/16.
//  Copyright © 2016 Miguel Hernández Jaso. All rights reserved.
//

import Foundation




class ComebacksDatastore
{
    // MARK: Private
    private(set) var comebacks: [Comeback]!
    private let comebacksResponsesCount: Int = 10
    
    
    
    // MARK: Init
    init()
    {
        self.comebacks = ComebacksProvider.retrieveComebacks()
    }
    
    
    
    
    // MARK: Public
    
    func comebacksForInsult(insult: Insult) -> [Comeback]
    {
        let comebacksFiltered = self.comebacks.filter( { (comeback: Comeback) -> Bool in
            return (comeback.insultIDs?.contains(insult.identifier))!
        })
        return comebacksFiltered
    }
    
    
    // Suffles an array of insults with a random array of other insults
    func shuffleComebacks(comebacks: [Comeback]) -> [Comeback]
    {
        var comebacksSet = Set<Comeback>()
        comebacksSet.unionInPlace(comebacks)
        
        let maxNumberOfComebacks = min(self.comebacks.count, comebacksResponsesCount)
        while comebacksSet.count < maxNumberOfComebacks {
            let randomIndex = Int.random(self.comebacks.count)
            comebacksSet.insert(self.comebacks[randomIndex])
        }

        return Array(comebacksSet)
    }
    
    
    
    
    // MARK: Private
    
    private func comebackForInsult(insult: Insult) -> Comeback
    {
        return Comeback(identifier: 1, phraseString: "Sí que las hay, sólo que nunca las has aprendido")
    }
    
    
}