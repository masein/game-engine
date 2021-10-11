//
//  GameObject.swift
//  Game Engine
//
//  Created by Masein Mody on 15/09/2021.
//
import MetalKit

class GameObject: Node {
  var modelConstants = ModelConstants()
  private var material = Material()
  var mesh: Mesh!
  private var _textureType: TextureTypes = TextureTypes.None
  
  init(meshType: MeshTypes) {
    mesh = Entities.Meshes[meshType]
  }
  
  override func update() {
    updateModelConstants()
    super.update()
  }
  
  private func updateModelConstants() {
    modelConstants.modelMatrix = modelMatrix
  }
}

extension GameObject: Renderable {
  func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
    renderCommandEncoder.setRenderPipelineState(Graphics.RenderPipelineStates[.Basic])
    renderCommandEncoder.setDepthStencilState(Graphics.DepthStencilStates[.Less])
    
    //Vertex Shader
    renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
    
    //Fragment Shader
    renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
    renderCommandEncoder.setFragmentSamplerState(Graphics.SamplerStates[.Linear], index: 0)
    if material.useTexture {
      renderCommandEncoder.setFragmentTexture(Entities.Textures[_textureType], index: 0)
    }
    
    mesh.drawPrimitives(renderCommandEncoder)
  }
}

//Material Properties
extension GameObject {
  public func setMaterialColor(_ color: float4) {
    material.color = color
    material.useMaterialColor = true
    material.useTexture = false
  }
  
  public func setTexture(_ textureType: TextureTypes) {
    _textureType = textureType
    material.useTexture = true
    material.useMaterialColor = false
  }
  
  // Is Lit
  public func setMaterialIsLit(_ isLit: Bool) { material.isLit = isLit }
  public func getMaterialIsLit() -> Bool { return material.isLit }
  
  // Ambient
  public func setMaterialAmbient(_ ambient: float3) { material.ambient = ambient }
  public func setMaterialAmbient(_ ambient: Float) { material.ambient = float3(ambient, ambient, ambient) }
  public func addMaterialAmbient(_ value: Float) { material.ambient += value }
  public func getMaterialAmbient() -> float3 { return material.ambient }
}
