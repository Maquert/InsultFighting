//
//  ComeBackCell.swift
//  InsultFighting
//
//  Created by Miguel Hernández Jaso on 22/01/16.
//  Copyright © 2016 Miguel Hernández Jaso. All rights reserved.
//

import UIKit




class ComebackCell: UITableViewCell
{
    // MARK: Outlets
    @IBOutlet weak var insult: UILabel!
    
    
    // MARK: ViewModel
    struct ViewData
    {
        let insult: String
    }
    
    
    var viewData: ViewData? {
        didSet {
            self.insult.text =  viewData?.insult
        }
    }
}




extension ComebackCell.ViewData
{
    init(comeback: Comeback)
    {
        self.insult = comeback.phrase
    }
}
