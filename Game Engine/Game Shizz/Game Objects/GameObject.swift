//
//  GameObject.swift
//  Game Engine
//
//  Created by Masein Mody on 15/09/2021.
//
import MetalKit

class GameObject: Node {
  var mesh: Mesh!
  private var material = Material()
  var modelConstants = ModelConstants()
  
  init(meshType: MeshTypes) {
    mesh = MeshLibrary.Mesh(meshType)
  }
  
  override func update(deltaTime: Float) {
    updateModelConstant()
  }
  
  private func updateModelConstant() {
    modelConstants.modelMatrix = self.modelMatrix
  }
}

extension GameObject: Renderable {
  func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
    renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
    renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.DepthStencilState(.Less))
    // Vertex Shader
    renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
    renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
    // Fragment Shader
    renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
    mesh.drawPrimitives(renderCommandEncoder)
  }
}

extension GameObject {
  public func setColor(_ color: float4) {
    material.color = color
    material.useMaterialColor = true
  }
}
