//
//  ShelfViewController.swift
//  publicLibrary
//
//  Created by Joao Paulo Galvao Alves on 6/23/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class ShelfViewController: UIViewController, UITableViewDataSource {
  
  var selectedLibrary = [Library]()
  var selectedSetOfShelves = [Shelf]()
  var shelfData = [String]()
  
  @IBOutlet weak var tableviewShelves: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    self.tableviewShelves.dataSource = self
    loadShelfFromPlist()
    
  }
  
  func loadShelfFromPlist() {
    
    if let shelfPath = NSBundle.mainBundle().pathForResource("Shelf", ofType: "plist"),
      shelfObjects = NSArray(contentsOfFile: shelfPath) as? [[String : AnyObject]]
    {
      for object in shelfObjects {
        
        if let shelfName = object["shelves"] as? [String] {
          let shelves = Shelf(shelves: shelfName)
            self.selectedSetOfShelves.append(shelves)
        }
      }
    }
  
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
    
    let libraryCell = self.tableviewShelves.dequeueReusableCellWithIdentifier("ShelfCell", forIndexPath: indexPath) as! UITableViewCell
    
    if self.selectedLibrary[indexPath.row] === 1 {
      
      println("Hello")
      
    }
    
    //let shelfToDisplay = self.selectedLibrary[indexPath.row]
    
    //libraryCell.textLabel?.text = shelfData[indexPath.row]
    
    return libraryCell
  }

  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
