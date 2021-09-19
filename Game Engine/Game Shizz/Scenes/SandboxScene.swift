//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Masein Mody on 19/09/2021.
//
import MetalKit

class SandboxScene: Scene {
  override func buildScene() {
    for y in -5..<5 {
      for x in -5..<5 {
        var player = Player()
        player.position.y = Float(Float(y)+0.5)/5
        player.position.x = Float(Float(x)+0.5)/5
        player.scale = float3(0.1)
        addChild(player)
      }
    }
  }
  
  override func update(deltaTime: Float) {
    for child in children {
      child.rotation.z += 0.02
    }
    super.update(deltaTime: deltaTime)
  }
}
