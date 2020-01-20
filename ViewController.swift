//
//  ViewController.swift
//  Shopping Cart
//
//  Created by Angelina Tsuboi on 1/19/20.
//  Copyright © 2020 Angelina Tsuboi. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var shoppingList = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Shopping Cart"
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for:indexPath)
        cell.textLabel?.text = shoppingList[indexPath.row]
        return cell
    }
    
    
    
    @IBAction func addItem(_ sender: Any) {
        var textfield = UITextField()
        let ac = UIAlertController(title: "Add Item", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Add", style: .default) { (action) in
            if(textfield.text != nil){
                self.shoppingList.append(textfield.text!)
                self.tableView.reloadData()
            }
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.addTextField{ (alertTextField) in
            alertTextField.placeholder = "Item to Add"
            textfield = alertTextField
        }
        
        present(ac, animated: true)
        
    }
    
    
    @IBAction func refreshItems(_ sender: Any) {
        let ac = UIAlertController(title: "Are you sure?", message: nil, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Yes", style: .default) { (action) in
            self.shoppingList.removeAll()
            self.tableView.reloadData()
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(ac, animated: true)
        
    }
    
    
    @IBAction func shareButtonPressed(_ sender: Any) {
        let list = shoppingList.joined(separator: "\n")
        let vc = UIActivityViewController(activityItems: [list], applicationActivities: [])
        present(vc, animated:true)
    }
    

}

