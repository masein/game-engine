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
    debugCamera.position.z = 100
    addCube()
  }
  
  var cubeCollection: CubeCollection!
  func addCube() {
    cubeCollection = CubeCollection(cubesWide: 10, cubesHigh: 10, cubesBack: 10)
    addChild(cubeCollection)
  }
  
  override func update(deltaTime: Float) {
    cubeCollection.rotation.z += deltaTime
    super.update(deltaTime: deltaTime)
  }
}
