//
//  GameObject.swift
//  Game Engine
//
//  Created by Masein Mody on 15/09/2021.
//
import MetalKit

class GameObject: Node {
  var mesh: Mesh!
  var modelConstants = ModelConstants()
  
  init(meshType: MeshTypes) {
    mesh = MeshLibrary.Mesh(meshType)
  }
  
  var time: Float = 0
  func update(deltaTime: Float) {
    time += deltaTime
//    position.x = sin(time)
//    position.y = sin(time)
    scale = float3(cos(time))
//    rotation.z = cos(time)
    updateModelConstant()
  }
  
  private func updateModelConstant() {
    modelConstants.modelMatrix = self.modelMatrix
  }
}

extension GameObject: Renderable {
  func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
    //    renderCommandEncoder.setTriangleFillMode(.lines)
    renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 1)
    renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
    renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
    renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
  }
}
