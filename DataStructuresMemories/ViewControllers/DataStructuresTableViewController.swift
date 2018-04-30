//
//  DataStructuresMemoriesTableViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/12/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit



class DataStructuresTableViewController: UITableViewController {
   
    let dataStructModel = DataSourceModel()
    
    // MARK: - UiTableViewController

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStructModel.getAmountOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataStructId", for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()
        }
        guard let dataStructure = DataStructure(rawValue: indexPath.row) else {  return UITableViewCell() }
        self.navigationItem.title = "Data Structures"
        let currentDataStruct = dataStructModel.getDataStructure(dataStructure)
        cell.configure(with: currentDataStruct)
        
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let targetController = mainStoryboard.instantiateViewController(withIdentifier: "DataStructId") as? DetailViewController else { return }
        guard let dataStructure = DataStructure(rawValue: indexPath.row) else { return }
        let currentDataType = dataStructModel.getDataStructure(dataStructure)
        
        targetController.selectedDataType = currentDataType
        
        self.navigationController?.pushViewController(targetController, animated: true)
    }
    
    override func viewDidLoad() {
        applyUI(set: UIColor.black, for: self.tableView)
    }
   
    func applyUI(set color: UIColor, for tableView: UITableView) {
        tableView.separatorColor = color
    }

}
