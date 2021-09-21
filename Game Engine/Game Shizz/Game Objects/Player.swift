//
//  Player.swift
//  Game Engine
//
//  Created by Masein Mody on 16/09/2021.
//
import MetalKit

class Player: GameObject {
  init() {
    super.init(meshType: .Triangle_Custom)
  }
  
  override func update(deltaTime: Float) {
    rotation.z = -atan2f(Mouse.GetMouseViewportPosition().x - position.x, Mouse.GetMouseViewportPosition().y - position.y)
    super.update(deltaTime: deltaTime)
  }
}
