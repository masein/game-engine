//
//  RenderPipelineDescriptorLibrary.swift
//  Game Engine
//
//  Created by Masein Mody on 12/09/2021.
//
import MetalKit

enum RenderPipelineDescriptorTypes {
  case Basic
}

class RenderPipelineDescriptorLibrary {
  private static var renderPipelineDescriptor: [RenderPipelineDescriptorTypes: RenderPipelineDescriptor] = [:]
  
  public static func Initialize() {
    createDefaultRenderPipelineDescriptor()
  }
  
  public static func createDefaultRenderPipelineDescriptor() {
    renderPipelineDescriptor.updateValue(Basic_RenderPipelineDescriptor(), forKey: .Basic)
  }
  
  public static func Desciptor(_ renderPipelineDescriptorType: RenderPipelineDescriptorTypes) -> MTLRenderPipelineDescriptor {
    return renderPipelineDescriptor[renderPipelineDescriptorType]!.renderPipelineDescriptor
  }
}

protocol RenderPipelineDescriptor {
  var name: String { get }
  var renderPipelineDescriptor: MTLRenderPipelineDescriptor! { get }
}

public struct Basic_RenderPipelineDescriptor: RenderPipelineDescriptor {
  var name: String = "Basic Render Pipeline Descriptor"
  var renderPipelineDescriptor: MTLRenderPipelineDescriptor!
  init() {
    renderPipelineDescriptor = MTLRenderPipelineDescriptor()
    renderPipelineDescriptor.colorAttachments[0].pixelFormat = Preferences.MainPixelFormat
    renderPipelineDescriptor.depthAttachmentPixelFormat = Preferences.MainDepthPixelFormat
    renderPipelineDescriptor.fragmentFunction = ShaderLibrary.Fragment(.Basic)
    renderPipelineDescriptor.vertexFunction = ShaderLibrary.Vertex(.Basic)
    renderPipelineDescriptor.vertexDescriptor = VertexDescriptorLibrary.Desciptor(.Basic)
  }
}
