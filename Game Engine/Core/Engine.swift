//
//  Engine.swift
//  Game Engine
//
//  Created by Masein Mody on 09/09/2021.
//
import MetalKit

class Engine {
  public static var Device: MTLDevice!
  public static var CommandQueue: MTLCommandQueue!
  
  public static func Ignite(device: MTLDevice) {
    Device = device
    CommandQueue = device.makeCommandQueue()
    ShaderLibrary.Initialize()
    VertexDescriptorLibrary.Initialize()
    RenderPipelineDescriptorLibrary.Initialize()
    RenderPipelineStateLibrary.Initialize()
    MeshLibrary.Initialize()
    SceneManager.Initialize(Preferences.StartingSceneType)
  }
}
