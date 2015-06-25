//
//  Books.swift
//  publicLibrary
//
//  Created by Joao Paulo Galvao Alves on 6/14/15.
//  Copyright (c) 2015 jalvestech. All rights reserved.
//

import Foundation

class Books {
  
  var books: String
  
  init(booksName: String) {
    
    self.books = booksName
    
  }
  
  func enshelf(books: String) ->String{
    return self.books
  }
  
  func unshelf(books: String) ->String{
    return self.books
  }
}
