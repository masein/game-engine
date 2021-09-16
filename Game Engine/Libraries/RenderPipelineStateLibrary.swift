//
//  RenderPipelineStateLibrary.swift
//  Game Engine
//
//  Created by Masein Mody on 12/09/2021.
//
import MetalKit

enum RenderPipelineStateTypes {
  case Basic
}

class RenderPipelineStateLibrary {
  private static var renderPipelineState: [RenderPipelineStateTypes: RenderPipelineState] = [:]
  
  public static func Initialize() {
    createDefaultRenderPipelineState()
  }
  
  public static func createDefaultRenderPipelineState() {
    renderPipelineState.updateValue(Basic_RenderPipelineState(), forKey: .Basic)
  }
  
  public static func PipelineState(_ renderPipelineStateType: RenderPipelineStateTypes) -> MTLRenderPipelineState {
    return renderPipelineState[renderPipelineStateType]!.renderPipelineState
  }
}

protocol RenderPipelineState {
  var name: String { get }
  var renderPipelineState: MTLRenderPipelineState { get }
}

public struct Basic_RenderPipelineState: RenderPipelineState {
  var name: String = "Basic Render Pipeline State"
  var renderPipelineState: MTLRenderPipelineState {
    var renderPipelineState: MTLRenderPipelineState!
    do {
      renderPipelineState = try Engine.Device.makeRenderPipelineState(descriptor: RenderPipelineDescriptorLibrary.Desciptor(.Basic))
    } catch let error as NSError {
      print("ERROR::CREATE::RENDER_PIPELINESTATE::__\(name)__::\(error)")
    }
    return renderPipelineState
  }
}