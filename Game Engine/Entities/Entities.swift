//
//  Entities.swift
//  Game Engine
//
//  Created by Masein Mody on 29/09/2021.
//
class Entities {
  private static var _meshLibrary: MeshLibrary!
  public static var Meshes: MeshLibrary { return _meshLibrary }
  
  public static func Initialize() {
    _meshLibrary = MeshLibrary()
  }
}
