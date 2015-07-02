//
//  LibraryViewController.swift
//  publicLibrary
//
//  Created by Joao Paulo Galvao Alves on 6/23/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
  
  var selMake = String()
  var selectedLabel: String?
//  
  var libraryData : [String] = ["Freemont", "Ballard", "Wedgewood", "Downtown"]

  
  
  @IBOutlet weak var tableViewLibraries: UITableView!
  
  // MARK: - Load Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableViewLibraries.dataSource = self
    self.tableViewLibraries.delegate = self
    
    //Add edit button
    self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    //self.tableViewLibraries.reloadData()
  }
  
  // MARK: - My Actions
  func addItem(sender:UIBarButtonItem) {
    
    println("Add button selected")
    
    let alert : UIAlertController = UIAlertController(title: "Library", message: "Add a new library:", preferredStyle: UIAlertControllerStyle.Alert)
    
    let saveAction : UIAlertAction = UIAlertAction(title: "Save", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
      let textField : UITextField = alert.textFields![0] as! UITextField
      self.saveName(name: textField.text)
      self.tableViewLibraries.reloadData()
    }
    
    let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default) { (action: UIAlertAction!) -> Void in
      self.editButtonItem().enabled = true
    }

    alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) -> Void in }
    alert.addAction(saveAction)
    alert.addAction(cancelAction)
    
    presentViewController(alert, animated: true, completion: nil)
    
  }
  
  func saveName(name newName: String) {
    let name = newName
    self.libraryData.append(name)
  }
  
  // MARK: - UITableView
  override func setEditing(editing: Bool, animated: Bool) {
    super.setEditing(editing, animated: animated)
    self.tableViewLibraries.setEditing(editing, animated: animated)
    if editing {
      
      self.editButtonItem().enabled = false
      
      //Add an add button
      self.navigationItem.setLeftBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "addItem:"), animated: true)
      
    } else {
      
      self.editButtonItem().enabled = true
    }
  }
  
  // MARK: - UITableViewDelegate  - View Controller specifies a deletion control
  func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
    if indexPath.row == self.libraryData.count {
      return UITableViewCellEditingStyle.Insert
    } else {
      return UITableViewCellEditingStyle.Delete
    }
  }
  
  func tableView(tableView: UITableView, didEndDisplayingCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
    self.editButtonItem().enabled = true
  }
  
  // MARK: - UITableViewDataSource
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return self.libraryData.count
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let libraryCell = self.tableViewLibraries.dequeueReusableCellWithIdentifier("LibraryCell", forIndexPath: indexPath) as! LibraryTableViewCell
    
    //let libraryToDisplay = self.library[indexPath.row]
  
    libraryCell.labelLibrary.text = libraryData[indexPath.row]
    
    return libraryCell
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    // If row is deleted, remove it from the list
    if editingStyle == UITableViewCellEditingStyle.Delete {
      self.libraryData.removeAtIndex(indexPath.row)
      self.tableViewLibraries.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
    } else {
      self.navigationController?.inputViewController?.inputAccessoryView
      
    }
    
  }
  
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowShelves" {
      
      if let shelvesViewController = segue.destinationViewController as? ShelfViewController {
        
        let myIndexPath = self.tableViewLibraries.indexPathForSelectedRow()
        
        if let indexPath = self.tableViewLibraries.indexPathForSelectedRow() {
          
          let selectedRow = indexPath.row
          let selectedLibrary = self.libraryData[selectedRow]
          println("Row \(indexPath.row) selected")
          shelvesViewController.selMake = selectedLibrary
          
        }
      }
    }
  }
}
















