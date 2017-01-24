//
//  ViewController.swift
//  Swift3App
//
//  Created by caozhuo on 2017/1/9.
//  Copyright © 2017年 caozhuo. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController,AddItemViewControllerDelegate {
    
    var items: [ChecklistItem]
    var delegate: AddItemViewControllerDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        		
        items = [ChecklistItem]()                 // add this line
        
        let row0item = ChecklistItem()            // let
        row0item.text = "Walk the dog"
        row0item.checked = false
        items.append(row0item)                    // add this line
        
        let row1item = ChecklistItem()            // let
        row1item.text = "Brush my teeth"
        row1item.checked = true
        items.append(row1item)                    // add this line
        
        let row2item = ChecklistItem()            // let
        row2item.text = "Learn iOS development"
        row2item.checked = true
        items.append(row2item)                    // add this line
        
        let row3item = ChecklistItem()            // let
        row3item.text = "Soccer practice"
        row3item.checked = false
        items.append(row3item)                    // add this line
        
        let row4item = ChecklistItem()            // let
        row4item.text = "Eat ice cream"
        row4item.checked = true 
        items.append(row4item)                    // add this line 
        
        super.init(coder: aDecoder)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        configureText(for: cell, with: item)
        configureCheckmark(for: cell,with: item)
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
           let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckmark(for: cell, with: item)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func tableView(_ tableView: UITableView,commit editingStyle: UITableViewCellEditingStyle,forRowAt indexPath: IndexPath){
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }
    
    func configureCheckmark(for cell: UITableViewCell,with item: ChecklistItem) {
        
        if item.checked {
            cell.accessoryType = .checkmark 
        } else { 
            cell.accessoryType = .none 
        }
    }
    func configureText(for cell: UITableViewCell,with item: ChecklistItem){
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    @IBAction func addItem(){
        let newRowIndex = items.count
        let item = ChecklistItem()
        item.text = "I am a new row"
        item.checked = false
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    func addItemViewControllerDidCancel(
        _ controller: AddItemViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func addItemViewController(_ controller: AddItemViewController,
                               didFinishAdding item: ChecklistItem) {
        dismiss(animated: true, completion: nil)
    }
}

