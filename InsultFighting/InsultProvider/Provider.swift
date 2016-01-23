//
//  Provider.swift
//  InsultFighting
//
//  Created by Miguel Hernández Jaso on 22/01/16.
//  Copyright © 2016 Miguel Hernández Jaso. All rights reserved.
//

import Foundation




class InsultsProvider: JSONProvider
{
    static func retrieveInsults() -> [Insult]
    {
        var insultsMutable = [Insult]()
        guard let insultsFile = super.parseJSONFile("Insults") else {
            return []
        }
        
        if let insults = insultsFile["insults"] as? NSArray {
            for insultDict: NSDictionary in insults as! [NSDictionary] {
                let insult = Insult(dictionary: insultDict)
                insultsMutable.append(insult)
            }
        }
        return insultsMutable
    }
}




class ComebacksProvider: JSONProvider
{
    static func retrieveComebacks() -> [Comeback]
    {
        var comebacksMutable = [Comeback]()
        guard let comebacksFile = super.parseJSONFile("Comebacks") else {
            return []
        }
        
        if let comebacks = comebacksFile["comebacks"] as? NSArray {
            for comebackDict: NSDictionary in comebacks as! [NSDictionary] {
                let comeback = Comeback(dictionary: comebackDict)
                comebacksMutable.append(comeback)
            }
        }
        return comebacksMutable
    }
}


class JSONProvider
{
    static func parseJSONFile(fileName: String) -> NSDictionary?
    {
        guard let path = NSBundle.mainBundle().pathForResource(fileName, ofType: "json") else {
            return nil
        }
        do {
            let jsonData = try NSData(contentsOfFile: path, options: NSDataReadingOptions.DataReadingMappedIfSafe)
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers )
            return jsonResult as? NSDictionary
        }
        catch {
            print("Error parsing JSON \(fileName): \(error)")
            return nil
        }
    }
}

