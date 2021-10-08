//
//  Graphics.swift
//  Game Engine
//
//  Created by Masein Mody on 29/09/2021.
//
class Graphics {
  
  private static var _vertexShaderLibrary: VertexShaderLibrary!
  public static var VertexShaders: VertexShaderLibrary { return _vertexShaderLibrary }
  
  private static var _fragmentShaderLibrary: FragmenthaderLibrary!
  public static var FragmentShaders: FragmenthaderLibrary { return _fragmentShaderLibrary }
  
  private static var _vertexDescriptorLibrary: VertexDescriptorLibrary!
  public static var VertexDescriptors: VertexDescriptorLibrary { return _vertexDescriptorLibrary }
  
  private static var _renderPipelineDescriptorLibrary: RenderPipelineDescriptorLibrary!
  public static var RenderPipelineDescriptors: RenderPipelineDescriptorLibrary { return _renderPipelineDescriptorLibrary }
  
  private static var _renderPipelineStateLibrary: RenderPipelineStateLibrary!
  public static var RenderPipelineStates: RenderPipelineStateLibrary { return _renderPipelineStateLibrary }
  
  private static var _depthStencilStateLibrary: DepthStencilStateLibrary!
  public static var DepthStencilStates: DepthStencilStateLibrary { return _depthStencilStateLibrary }
  
  private static var _samplerStateLibrary: SamplerStateLibrary!
  public static var SamplerStates: SamplerStateLibrary { return _samplerStateLibrary }
  
  public static func Initialize() {
    _vertexShaderLibrary = VertexShaderLibrary()
    _fragmentShaderLibrary = FragmenthaderLibrary()
    _vertexDescriptorLibrary = VertexDescriptorLibrary()
    _renderPipelineDescriptorLibrary = RenderPipelineDescriptorLibrary()
    _renderPipelineStateLibrary = RenderPipelineStateLibrary()
    _depthStencilStateLibrary = DepthStencilStateLibrary()
    _samplerStateLibrary = SamplerStateLibrary()
  }
}
