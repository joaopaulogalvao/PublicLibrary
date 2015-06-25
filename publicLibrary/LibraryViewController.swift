//
//  LibraryViewController.swift
//  publicLibrary
//
//  Created by Joao Paulo Galvao Alves on 6/23/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController,UITableViewDataSource {
  
  var library = [Library]()
  var shelves = [Shelf]()
  
  @IBOutlet weak var tableViewLibraries: UITableView!
  
  // MARK: - Load Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableViewLibraries.dataSource = self
    loadLibraryFromPlist()
    
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
  
  func loadLibraryFromPlist() {
    
    if let libraryPath = NSBundle.mainBundle().pathForResource("Library", ofType: "plist"),
      libraryObjects = NSArray(contentsOfFile: libraryPath) as? [[String : AnyObject]]
    {
      for object in libraryObjects {
        
        if let libraryName = object["libraryName"] as? String, shelvesCount = object["shelvesCount"] as? Int, shelves = object["shelves"] as? Array<Shelf> {
            let library = Library(libraryName: libraryName, shelvesCount: shelvesCount, shelves: shelves)
            self.library.append(library)
        }
      }
    }
    
  }
  
  // MARK: - UITableViewDataSource
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return self.library.count
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let libraryCell = self.tableViewLibraries.dequeueReusableCellWithIdentifier("LibraryCell", forIndexPath: indexPath) as! UITableViewCell
    
    let libraryToDisplay = self.library[indexPath.row]
  
    libraryCell.textLabel?.text = libraryToDisplay.libraryName
    
    return libraryCell
  }
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    if segue.identifier == "ShowShelves" {
      
      if let shelflViewController = segue.destinationViewController as? ShelfViewController {
        
        let myIndexPath = self.tableViewLibraries.indexPathForSelectedRow()
        
        if let indexPath = self.tableViewLibraries.indexPathForSelectedRow() {
          
          let selectedRow = indexPath.row
          
          // selected Library grabs a reference from the clicked library
          //let selectedLibrary = self.library[selectedRow]
          let selectedLibrary = self.shelves[selectedRow]
          
          //println(selectedLibrary.shelfLabel)
          
          // Pass the selected object to the new view controller.
          shelflViewController.selectedShelf = selectedLibrary 
          // detailViewController.setupTextFields()
          
        }
        
      }
      
    }
    
  }

}
















