//
//  FakeDataTableViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/26/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class FakeDataTableViewController: UITableViewController{
    
    private var dataHolder = [Int]()
    
    func delete() {
        if dataHolder.count > 0 {            
            numberOfRows -= 1
            self.higlightedIndex = self.dataModel?.deletedIndex            
            self.dataModel?.delete()
            dataHolder.remove(at: 0)
            guard let deletedIndex = self.higlightedIndex else { return }
            tableView.deleteRows(at: [IndexPath(row: deletedIndex , section: 0)], with: .middle)
        }
    }
    
    func highlight(by index: Int) {
        
    }
    
    func add(element: Int) {
        self.higlightedIndex = self.dataModel?.addedIndex
        numberOfRows += 1
        self.dataModel?.add(element: numberOfRows)
        dataHolder.append(numberOfRows)
        guard let addeddIndex = self.higlightedIndex else { return }
        tableView.insertRows(at: [IndexPath(row: addeddIndex, section: 0)], with: .left)
    }
    
    var numberOfRows = 0
    
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
        return dataHolder.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "idFakeDataCell", for: indexPath)
        guard let model = self.dataModel, let higlightedIndex = self.higlightedIndex else { return cell }
        let title = model.dataHolder[indexPath.row].toString()
        cell.configure(indexPath: indexPath, with: title, highlightIndex: higlightedIndex)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension UITableViewCell {
    func configure(indexPath: IndexPath, with title: String, highlightIndex: Int) {
        guard let textLabel = self.textLabel else { return }
        let title = title
        let index = indexPath.row
        UIView.animate(withDuration: 2) {
            self.backgroundColor = (index == highlightIndex) ? UIColor.green : UIColor.yellow
//        }
//        UIView.animate(withDuration: 3) {
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


