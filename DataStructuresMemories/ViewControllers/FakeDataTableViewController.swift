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
        guard let dataHolder = dataModel?.dataHolder else { return }
        if dataHolder.count > 0 {
            self.higlightedIndex = self.dataModel?.deletedIndex
            guard let deletedIndex = self.higlightedIndex else { return }
            self.dataModel?.delete()
            tableView.deleteRows(at: [IndexPath(row: deletedIndex , section: 0)], with: .middle)
        }
    }
    
    func highlight(by index: Int) {
        
    }
    
    func add(element: Int) {
        self.higlightedIndex = self.dataModel?.addedIndex
        guard let addeddIndex = self.higlightedIndex else { return }
        self.dataModel?.add(element: addeddIndex)
        tableView.insertRows(at: [IndexPath(row: addeddIndex, section: 0)], with: .left)
    }
    
    var higlightedIndex: Int? {
        didSet {
            UIView.animate(withDuration: 4) {
                self.tableView.reloadData()
            }
        }
    }
    var dataModel: FakeDataProtocol?
    var typeOfData: DataType?
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let array = dataModel?.dataHolder else { return 0 }
        return array.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idFakeDataCell", for: indexPath)
        guard let model = self.dataModel, let higlightedIndex = self.higlightedIndex else { return cell }
        let title = model.dataHolder[indexPath.row].toString()
        cell.configure(at: indexPath.row, with: title, highlightIndex: higlightedIndex)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension UITableViewCell {
    func configure(at index: Int, with title: String, highlightIndex: Int) {
        guard let textLabel = self.textLabel else { return }
        UIView.animate(withDuration: 2) {
            self.backgroundColor = (index == highlightIndex) ? UIColor.green : UIColor.yellow
            self.backgroundColor = UIColor.yellow
        }
        textLabel.text = title
        textLabel.textAlignment = .center
        textLabel.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
    }
}

extension Int {
    func toString() -> String {
        return String(self)
    }
}


