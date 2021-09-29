//
//  DebugCamera.swift
//  Game Engine
//
//  Created by Masein Mody on 21/09/2021.
//
import simd

class DebugCamera: Camera {
  override var projectionMatrix: matrix_float4x4 {
    return matrix_float4x4.perspective(degreesFov: 45,
                                       aspectRatio: Renderer.AspectRatio,
                                       near: 0.1,
                                       far: 1000)
  }
  
  init() {
    super.init(cameraType: .Debug)
  }
  
  override func doUpdate() {
    if Keyboard.IsKeyPressed(.leftArrow) {
      moveX(-GameTime.DeltaTime)
    }
    if Keyboard.IsKeyPressed(.rightArrow) {
      moveX(GameTime.DeltaTime)
    }
    if Keyboard.IsKeyPressed(.upArrow) {
      moveY(GameTime.DeltaTime)
    }
    if Keyboard.IsKeyPressed(.downArrow) {
      moveY(-GameTime.DeltaTime)
    }
  }
}
