//
//  Entities.swift
//  Game Engine
//
//  Created by Masein Mody on 29/09/2021.
//
class Entities {
  private static var _meshLibrary: MeshLibrary!
  public static var Meshes: MeshLibrary { return _meshLibrary }
  private static var _textureLibrary: TextureLibrary!
  public static var Textures: TextureLibrary { return _textureLibrary }
  
  public static func Initialize() {
    _meshLibrary = MeshLibrary()
    _textureLibrary = TextureLibrary()
  }
}
