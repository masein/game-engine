//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Masein Mody on 19/09/2021.
//
import MetalKit

class SandboxScene: Scene {
  var debugCamera = DebugCamera()
  
  override func buildScene() {
    addCamera(debugCamera)
    debugCamera.position.z = 13
    addCube()
  }
  
  func addCube() {
    for y in -5..<5 {
      let posY = Float(y) + 0.5
      for x in -8..<8 {
        let posX = Float(x) + 0.5
        let cube = Cube()
        cube.position.x = posX
        cube.position.y = posY
        cube.scale = float3(0.3)
        cube.setColor(ColorUtils.randomColor)
        addChild(cube)
      }
    }
  }
}
