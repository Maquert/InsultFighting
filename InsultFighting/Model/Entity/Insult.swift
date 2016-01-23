

import Foundation



class InsultBase
{
    
    // MARK: Attributes
    let identifier: Int
    private let phraseString: String  // string identifier
    var phrase: String {  // Localized string
        get { return NSLocalizedString(phraseString, comment: "") }
    }
    
    
    // MARK: Init
    
    init(identifier: Int, phraseString: String)
    {
        self.identifier = identifier
        self.phraseString = phraseString
    }
    
}


extension InsultBase: Hashable
{
    var hashValue: Int { return self.identifier }
}


extension InsultBase: Equatable {}
func ==(lhs: InsultBase, rhs: InsultBase) -> Bool
{
    return lhs.identifier == rhs.identifier
}




// MARK: Subclasses

class Insult: InsultBase
{
    private let effectiveComebackIDs: [Int]?
    
    init(identifier: Int, phraseString: String, comebacks: [Int]? = nil)
    {
        self.effectiveComebackIDs = comebacks
        super.init(identifier: identifier, phraseString: phraseString)
    }
    
    
    init(dictionary: NSDictionary)
    {
        let identifier = dictionary["id"] as! Int
        let phraseString = dictionary["phrase"] as! String
        self.effectiveComebackIDs = dictionary["comebacks"] as? [Int]
        super.init(identifier: identifier, phraseString: phraseString)
    }
    
    
    
    
    // MARK: Public
    
    func isComebackEffective(comeback: Comeback) -> Bool
    {
        guard self.effectiveComebackIDs?.first != 0 else { return true }
        return (self.effectiveComebackIDs?.contains(comeback.identifier))!
    }
}




class Comeback: InsultBase
{
    private (set)var insultIDs: [Int]?
    
    init(identifier: Int, phraseString: String, insults: [Int]? = nil)
    {
        self.insultIDs = insults
        super.init(identifier: identifier, phraseString: phraseString)
    }
    
    
    init(dictionary: NSDictionary)
    {
        let identifier = dictionary["id"] as! Int
        let phraseString = dictionary["phrase"] as! String
        self.insultIDs = dictionary["insults"] as? [Int]
        super.init(identifier: identifier, phraseString: phraseString)
    }
    
}




