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
















