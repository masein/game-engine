//
//  Cube.swift
//  Game Engine
//
//  Created by Masein Mody on 23/09/2021.
//
import MetalKit

class Cube: GameObject {
  
  init() {
    super.init(meshType: .Cube_Custom)
    self.setName("Cube")
  }
  
  override func doUpdate() {
    rotateX(GameTime.DeltaTime)
    rotateY(GameTime.DeltaTime)
  }
}
