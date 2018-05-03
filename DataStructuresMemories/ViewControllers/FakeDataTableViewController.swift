//
//  FakeDataTableViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/26/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class FakeDataTableViewController: UITableViewController{
    
    func delete() {
        if dataModel.dataHolder.count > 0 {
            dataModel.delete()
            let cell = tableView.cellForRow(at: IndexPath(row: 0, section: 0))
            cell?.backgroundColor = UIColor.green
            UIView.animate(withDuration: 3) {
                self.tableView.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .right)
            }
        }
    }
    
    func highlight(by index: Int) {
        
    }
    
    func add(element: Int) {
        dataModel.add(element: numberOfRows)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .bottom)
        
        numberOfRows += 1
        higlightedIndex = dataModel.dataHolder.count - 1
    }
    
    var numberOfRows = 0 {
        didSet {
            tableView.reloadData()
        }
    }
    
    var higlightedIndex: Int?
    
    var dataModel = StackFakeDataModel()
    
    var typeOfData: DataType?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.dataHolder.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idFakeDataCell", for: indexPath)
        guard let textLabel = cell.textLabel else { return cell }
        
        cell.textLabel?.text = dataModel.dataHolder[indexPath.row].toString()
        
        UIView.animate(withDuration: 0.5) {
            cell.backgroundColor = (indexPath.row == self.higlightedIndex) ? UIColor.green : UIColor.yellow

        }
        
        UIView.animate(withDuration: 2) {
            cell.backgroundColor = UIColor.yellow
        }
        
        
        textLabel.textAlignment = .center
        textLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
}

extension Int {
    func toString() -> String {
        return String(self)
    }
}
