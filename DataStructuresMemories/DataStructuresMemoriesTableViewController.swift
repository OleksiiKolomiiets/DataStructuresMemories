//
//  DataStructuresMemoriesTableViewController.swift
//  DataStructuresMemories
//
//  Created by Oleksii Kolomiiets on 4/12/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit



class DataStructuresMemoriesTableViewController: UITableViewController {
   
    let dataStructModel = DataStructModel()
    
    // MARK: - UiTableViewController

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableView.separatorColor = #colorLiteral(red: 0.1215686275, green: 0.1294117647, blue: 0.1411764706, alpha: 1)
        return dataStructModel.getAmountOfRows()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataStructId", for: indexPath) as CustomTableViewCell
//        cell.labelOfCell.text = dataStructModel.getNameOfDataStructureMemorise(at: indexPath.row)
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DataStructId", for: indexPath) as? CustomTableViewCell else {
            fatalError("Expected object: \(tableView.dequeueReusableCell(withIdentifier: "DataStructId", for: indexPath)) to be of type: CustomTableViewCell")
        }
        cell.labelOfCell.text = dataStructModel.getNameOfDataStructureMemorise(at: indexPath.row)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        applyUI()
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
