//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Masein Mody on 19/09/2021.
//
import MetalKit

class SandboxScene: Scene {
  var debugCamera = DebugCamera()
  var quad = Quad()
  
  override func buildScene() {
    addCamera(debugCamera)
    debugCamera.setPositionZ(5)
    addChild(quad)
  }
  
  override func doUpdate() {
    quad.setPositionX(cos(GameTime.TotalGameTime))
  }
}
