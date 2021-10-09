//
//  SandboxScene.swift
//  Game Engine
//
//  Created by Masein Mody on 19/09/2021.
//
import MetalKit

class SandboxScene: Scene {
  var debugCamera = DebugCamera()
  var cruiser = Cruiser()
  
  override func buildScene() {
    addCamera(debugCamera)
    debugCamera.setPositionZ(5)
    addChild(cruiser)
  }
  
  override func doUpdate() {
    if Mouse.IsMouseButtonPressed(button: .left) {
      cruiser.rotateX(Mouse.GetDY()*GameTime.DeltaTime)
      cruiser.rotateY(Mouse.GetDX()*GameTime.DeltaTime)
    }
  }
}
