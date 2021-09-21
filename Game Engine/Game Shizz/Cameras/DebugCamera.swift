//
//  DebugCamera.swift
//  Game Engine
//
//  Created by Masein Mody on 21/09/2021.
//
import simd

class DebugCamera: Camera {
  var cameraType: CameraTypes = CameraTypes.Debug
  
  var position: float3 = float3(0,0,0)
  
  func update(deltaTime: Float) {
    if Keyboard.IsKeyPressed(.leftArrow) {
      position.x -= deltaTime
    }
    
    if Keyboard.IsKeyPressed(.rightArrow) {
      position.x += deltaTime
    }
    
    if Keyboard.IsKeyPressed(.upArrow) {
      position.y += deltaTime
    }
    
    if Keyboard.IsKeyPressed(.downArrow) {
      position.y -= deltaTime
    }
  }
}
