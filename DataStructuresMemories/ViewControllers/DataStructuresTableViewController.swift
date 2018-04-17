//
//  DataStructuresMemoriesTableViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/12/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit



class DataStructuresTableViewController: UITableViewController {
   
    let dataStructModel = DataStructuresModel(0)
    
    // MARK: - UiTableViewController

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataStructModel.getAmountOfRows()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataStructId", for: indexPath) as? CustomTableViewCell else {
            fatalError("Expected object: \(tableView.dequeueReusableCell(withIdentifier: "DataStructId", for: indexPath)) to be of type: CustomTableViewCell")
        }
        self.navigationItem.title = "Data Structures"
        
        cell.configure(DataStructuresModel(indexPath.row))
        print(cell)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        guard let targetController = mainStoryboard.instantiateViewController(withIdentifier: "DataStructId") as? DataStructViewController else {
            return
        }
        targetController.titleText = DataStructuresModel(indexPath.row).currentDataStruct?.name
        self.navigationController?.pushViewController(targetController, animated: false)
    }
    
    override func viewDidLoad() {
        applyUI(set: UIColor.black, for: self.tableView)
    }
   
    func applyUI(set color: UIColor, for tableView: UITableView) {
        tableView.separatorColor = color
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
