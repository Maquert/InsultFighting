//
//  InsultTest.swift
//  InsultFighting
//
//  Created by Miguel Hernández Jaso on 22/01/16.
//  Copyright © 2016 Miguel Hernández Jaso. All rights reserved.
//

import XCTest

class InsultTest: XCTestCase
{
    var damnGoodComeback: Comeback!
    var terribleComback: Comeback!
    var goodInsult: Insult!
    
    
    
    
    override func setUp()
    {
        super.setUp()
        
        self.damnGoodComeback = Comeback(identifier: 990, phraseString: "You make me think somebody already did")
        self.terribleComback = Comeback(identifier: 999, phraseString: "Ack, chee, ick!")
        self.goodInsult = Insult(identifier: 1, phraseString: "You make me want to puke", comebacks: [990])
    }
    
    
    override func tearDown()
    {
        self.damnGoodComeback = nil
        self.terribleComback = nil
        self.goodInsult = nil
        super.tearDown()
    }

    
    
    
    // MARK: Tests
    
    func testGoodComeback()
    {
        XCTAssert( self.goodInsult.isComebackEffective(self.damnGoodComeback) )
    }
    
    
    func testBadComeback()
    {
        XCTAssertFalse( self.goodInsult.isComebackEffective(self.terribleComback) )
    }
    

}
