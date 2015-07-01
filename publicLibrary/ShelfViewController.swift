//
//  ShelfViewController.swift
//  publicLibrary
//
//  Created by Joao Paulo Galvao Alves on 6/23/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class ShelfViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  var selMake = String()
  var shelfData : [String] = []
  
  
  @IBOutlet weak var tableviewShelves: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    self.tableviewShelves.dataSource = self
    
    
    switch selMake {
  
    case "Freemont" :
      shelfData = ["Shelf 1", "Shelf 2", "Shelf 3"]
    break
      
    case "Ballard" :
      shelfData = ["Shelf 1", "Shelf 2", "Shelf 3", "Shelf 4"]
    break
      
    case "Wedgewood" :
      shelfData = ["Shelf 1", "Shelf 2", "Shelf 3", "Shelf 4", "Shelf 5"]
    break
      
    case "Downtown" :
      shelfData = ["Shelf 1", "Shelf 2", "Shelf 3", "Shelf 4", "Shelf 5", "Shelf 6"]
    break
      
    default:
      println("Sel Make \(selMake)")
      break
    }
    
    //self.tableviewShelves.reloadData()
    
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - UITableViewDataSource
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return self.shelfData.count
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let libraryCell = self.tableviewShelves.dequeueReusableCellWithIdentifier("ShelfCell", forIndexPath: indexPath) as! ShelvesTableViewCell
    
    //let shelfToDisplay = self.selectedLibrary[indexPath.row]
    
    libraryCell.textLabel?.text = shelfData[indexPath.row]
    
    return libraryCell
  }
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "ShowBooks" {
      
      if let booksViewController = segue.destinationViewController as? BooksViewController {
        
        let myIndexPath = self.tableviewShelves.indexPathForSelectedRow()
        
        if let indexPath = self.tableviewShelves.indexPathForSelectedRow() {
          
          let selectedRow = indexPath.row
          let selectedShelf = self.shelfData[selectedRow]
          println("Row \(indexPath.row) selected")
          booksViewController.selMake = selectedShelf
          
        }
      }
    }
  }
}
