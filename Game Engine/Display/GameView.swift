//
//  GameView.swift
//  Game Engine
//
//  Created by Masein Mody on 29/08/2021.
//
import MetalKit

class GameView: MTKView {
  var renderer: Renderer!
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    device = MTLCreateSystemDefaultDevice()
    Engine.Ignite(device: device!)
    clearColor = Preferences.ClearColor
    colorPixelFormat = Preferences.MainPixelFormat
    renderer = Renderer()
    delegate = renderer
  }
}
