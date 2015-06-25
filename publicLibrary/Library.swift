//
//  Library.swift
//  publicLibrary
//
//  Created by Joao Paulo Galvao Alves on 6/14/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import Foundation

class Library {
  
  
  var libraryName: String
  var shelvesCount: Int
  var shelves : [Shelf]!
  
  init (libraryName: String, shelvesCount: Int, shelves: [Shelf] ){
    
    self.libraryName = libraryName
    self.shelvesCount = shelvesCount
    self.shelves = shelves
  }
  
//  func countShelves (numberOfShelves: Int) -> Int{
//    return numberOfShelves
//  }

}