//
//  ComebacksTableDatasource.swift
//  InsultFighting
//
//  Created by Miguel Hernández Jaso on 22/01/16.
//  Copyright © 2016 Miguel Hernández Jaso. All rights reserved.
//

import UIKit




class ComebacksTableDatasource: NSObject, UITableViewDataSource
{
    
    // MARK: Private
    private var comebacks: [Comeback]
    
    
    
    
    // MARK: Init
    init(comebacks: [Comeback])
    {
        self.comebacks = comebacks
        super.init()
    }
    
    
    func comebackAtIndex(index: Int) -> Comeback
    {
        return self.comebacks[index]
    }
    
    
    
    
    // MARK: Datasource
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.comebacks.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! ComebackCell
        let comeback = self.comebacks[indexPath.row]
        cell.viewData = ComebackCell.ViewData(comeback: comeback)
        
        return cell
    }
    
}