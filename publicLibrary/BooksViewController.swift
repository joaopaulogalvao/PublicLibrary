//
//  BooksViewController.swift
//  publicLibrary
//
//  Created by Joao Paulo Galvao Alves on 6/23/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import UIKit

class BooksViewController: UIViewController,UITableViewDataSource {
  
  @IBOutlet weak var tableViewBooks: UITableView!
  
  var selMake = String()
  var booksData : [String] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    self.tableViewBooks.dataSource = self
    
    switch selMake {
      
    case "Shelf 1" :
      booksData = ["English Book 1", "English Book 2", "English Book 3"]
      break
      
    case "Shelf 2" :
      booksData = ["Math Book 1", "Math Book 2", "Math Book 3", "Math Book 4"]
      break
      
    case "Shelf 3" :
      booksData = ["Philosophy Book 1", "Philosophy Book 2", "Philosophy Book 3", "Philosophy Book 4", "Philosophy Book 5"]
      break
      
    case "Shelf 4" :
      booksData = ["Romance Book 1", "Romance Book 2", "Romance Book 3", "Romance Book 4", "Romance Book 5", "Romance Book 6"]
      break
    
    case "Shelf 5" :
      booksData = ["Science Book 1", "Science Book 2", "Science Book 3", "Science Book 4", "Science Book 5", "Science Book 6","Science Book 7"]
      break
      
    case "Shelf 6" :
      booksData = ["Sports Book 1", "Sports Book 2", "Sports Book 3", "Sports Book 4", "Sports Book 5", "Sports Book 6","Sports Book 7","Sports Book 8"]
      break
      
    default:
      println("Sel Make \(selMake)")
      break
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
    
    return self.booksData.count
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let libraryCell = self.tableViewBooks.dequeueReusableCellWithIdentifier("BooksCell", forIndexPath: indexPath) as! BooksTableViewCell
    
    //let shelfToDisplay = self.selectedLibrary[indexPath.row]
    
    libraryCell.textLabel?.text = booksData[indexPath.row]
    
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
