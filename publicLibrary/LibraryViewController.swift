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
  
  func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
    
    //println("Row \(indexPath.row) selected")
    
    selMake = libraryData[indexPath.row]
    
    
  }
  

  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    if(segue.identifier == "ShowShelves") {
      var vc = segue.destinationViewController as! ShelfViewController
      vc.selMake = selMake
    }
    
  }

}
















