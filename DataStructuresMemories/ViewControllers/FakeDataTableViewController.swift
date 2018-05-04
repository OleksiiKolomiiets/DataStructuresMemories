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
            self.higlightedIndex = self.dataModel?.deletedIndex
            numberOfRows -= 1
            dataHolder.remove(at: 0)
            self.dataModel?.delete()
            UIView.animate(withDuration: 3) {
                self.tableView.deleteRows(at: [IndexPath(row: self.higlightedIndex! , section: 0)], with: .right)
            }
        }
    }
    
    func highlight(by index: Int) {
        
    }
    
    func add(element: Int) {
        self.higlightedIndex = self.dataModel?.addedIndex
        numberOfRows += 1
        self.dataModel?.add(element: numberOfRows)
        dataHolder.append(numberOfRows)
        self.tableView.insertRows(at: [IndexPath(row: self.higlightedIndex!, section: 0)], with: .bottom)
        tableView.reloadData()
    }
    
    var numberOfRows = 0 {
        didSet {
            tableView.reloadData()
        }
    }
    
    var higlightedIndex: Int?
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
        guard let model = self.dataModel else { return cell }
        let data = model.getDataHolder()
        cell.configure(indexPath: indexPath, with: data, highlightIndex: higlightedIndex!)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension UITableViewCell {
    func configure(indexPath: IndexPath, with data: [Int], highlightIndex: Int) {
        guard let textLabel = self.textLabel else { return }
        let title = data[indexPath.row].toString()
        UIView.animate(withDuration: 0.5) {
            self.backgroundColor = (indexPath.row == highlightIndex) ? UIColor.green : UIColor.yellow
        }
        UIView.animate(withDuration: 2) {
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


