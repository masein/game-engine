//
//  Library.swift
//  Game Engine
//
//  Created by Masein Mody on 29/09/2021.
//
class Library<T,K> {
  init() {
    fillLibrary()
  }
  
  func fillLibrary() {
    //Override this function when filling the library with default values
  }
  
  subscript(_ type: T) -> K? {
    return nil
  }
}
