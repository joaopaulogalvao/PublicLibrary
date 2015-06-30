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
      
      
    case "Wedgewood" :
      shelfData = ["Shelf 1", "Shelf 2", "Shelf 3", "Shelf 4", "Shelf 5"]
      
      
    case "Downtown" :
      shelfData = ["Shelf 1", "Shelf 2", "Shelf 3", "Shelf 4", "Shelf 5", "Shelf 6"]
      
      
    default:
      println("Sel Make \(selMake)")
    }
    
    self.tableviewShelves.reloadData()
    
    
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
  
//  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//    println("Row \(indexPath.row)selected")
//    
//    performSegueWithIdentifier("ShowBooks", sender: self)
//  }

  
  

  // MARK: - Navigation
  

  
}
