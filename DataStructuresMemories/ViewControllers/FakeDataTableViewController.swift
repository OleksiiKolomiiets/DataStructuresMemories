//
//  FakeDataTableViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/26/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class FakeDataTableViewController: UITableViewController, FakeDataProtocol {
    func delete() {
        if numberOfRows > 0 {
            numberOfRows -= 1
        }
    }
    
    func highlight(by index: Int) {
        
    }
    
    func add() {
        numberOfRows += 1
    }
    
    var numberOfRows = 0 {
        didSet {
            tableView.reloadData()
        }
    }
    
    var typeOfData: DataType?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idFakeDataCell", for: indexPath)
        cell.backgroundColor = setColorForCell(at: indexPath)
        cell.separatorInset.bottom = 2.0
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.reloadData()
    }
    
    private func setColorForCell(at index: IndexPath) -> UIColor {
        guard let typeOfData = typeOfData else { return UIColor.brown }
        switch typeOfData {
        case .stack:
            return index.row == 0 ? UIColor.blue: UIColor.gray
//        case .queue:
//            if
        default:
            return UIColor.brown
        }
    }
 
}
