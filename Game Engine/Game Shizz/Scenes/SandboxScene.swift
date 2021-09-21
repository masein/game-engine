//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Masein Mody on 19/09/2021.
//
import MetalKit

class SandboxScene: Scene {
  override func buildScene() {
    let count: Int = 5
    for y in -count..<count {
      for x in -count..<count {
        var player = Player()
        player.position.y = Float(Float(y)+0.5)/Float(count)
        player.position.x = Float(Float(x)+0.5)/Float(count)
        player.scale = float3(0.1)
        addChild(player)
      }
    }
  }
}
