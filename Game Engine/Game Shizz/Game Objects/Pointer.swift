//
//  Pointer.swift
//  Game Engine
//
//  Created by Masein Mody on 16/09/2021.
//
import MetalKit

class Pointer: GameObject {
  private var camera: Camera
  init(camera: Camera) {
    self.camera = camera
    super.init(meshType: .Triangle_Custom)
  }
  
  override func update(deltaTime: Float) {
    rotation.z = -atan2f(Mouse.GetMouseViewportPosition().x - position.x + camera.position.x,
                         Mouse.GetMouseViewportPosition().y - position.y + camera.position.y)
    super.update(deltaTime: deltaTime)
  }
}
