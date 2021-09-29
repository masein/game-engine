//
//  Pointer.swift
//  Game Engine
//
//  Created by Masein Mody on 16/09/2021.
//
import MetalKit

class Pointer: GameObject {
  
  private var camera: Camera!
  init(camera: Camera) {
    super.init(meshType: .Triangle_Custom)
    self.camera = camera
    setName("Pointer")
  }
  
  override func doUpdate() {
    rotateZ(-atan2f(Mouse.GetMouseViewportPosition().x - getPositionX() + camera.getPositionX(),
                    Mouse.GetMouseViewportPosition().y - getPositionY() + camera.getPositionY()))
    
  }
}
