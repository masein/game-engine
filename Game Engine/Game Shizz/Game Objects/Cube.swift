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
  }
  
  override func update(deltaTime: Float) {
    rotation.x += (Float.randomZeroToOne * deltaTime)
    rotation.y += (Float.randomZeroToOne * deltaTime)
    super.update(deltaTime: deltaTime)
  }
}
