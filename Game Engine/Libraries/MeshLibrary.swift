//
//  MeshLibrary.swift
//  Game Engine
//
//  Created by Masein Mody on 16/09/2021.
//
import MetalKit

enum MeshTypes {
  case Triangle_Custom
  case Quad_Custom
  case Cube_Custom
}
class MeshLibrary {
  private static var meshes: [MeshTypes: Mesh] = [:]
  
  public static func Initialize() {
    createDefualtMeshes()
  }
  
  private static func createDefualtMeshes() {
    meshes.updateValue(Triangle_CustomeMesh(), forKey: .Triangle_Custom)
    meshes.updateValue(Quad_CustomMesh(), forKey: .Quad_Custom)
    meshes.updateValue(Cube_CustomMesh(), forKey: .Cube_Custom)
  }
  
  public static func Mesh(_ meshType: MeshTypes) -> Mesh {
    meshes[meshType]!
  }
}

protocol Mesh {
  var vertexBuffer: MTLBuffer! { get }
  var vertexCount: Int! { get }
  func setInstanceCount(_ count: Int)
  func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder)
}

class CustomMesh: Mesh {
  var vertices: [Vertex]!
  var vertexBuffer: MTLBuffer!
  var instanceCount: Int = 1
  var vertexCount: Int! {
    vertices.count
  }
  
  init() {
    createVertices()
    createBuffers()
  }
  
  func createVertices() { }
  
  func createBuffers() {
    vertexBuffer = Engine.Device.makeBuffer(bytes: vertices,
                                            length: Vertex.stride(vertices.count),
                                            options: [])
  }
  
  func setInstanceCount(_ count: Int) {
    instanceCount = count
  }
  
  func drawPrimitives(_ renderCommandEncoder: MTLRenderCommandEncoder) {
    renderCommandEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
    renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertexCount, instanceCount: instanceCount)
  }
}

class Triangle_CustomeMesh: CustomMesh {
  override func createVertices() {
    vertices = [
      Vertex(position: float3(0,1,0), color: float4(1,0,0,1)),
      Vertex(position: float3(-1,-1,0), color: float4(0,1,0,1)),
      Vertex(position: float3(1,-1,0), color: float4(0,0,1,1))
    ]
  }
}

class Quad_CustomMesh: CustomMesh {
  override func createVertices() {
    vertices = [
      Vertex(position: float3( 1, 1,0), color: float4(1,0,0,1)), //Top Right
      Vertex(position: float3(-1, 1,0), color: float4(0,1,0,1)), //Top Left
      Vertex(position: float3(-1,-1,0), color: float4(0,0,1,1)),  //Bottom Left
      Vertex(position: float3( 1, 1,0), color: float4(1,0,0,1)), //Top Right
      Vertex(position: float3(-1,-1,0), color: float4(0,0,1,1)), //Bottom Left
      Vertex(position: float3( 1,-1,0), color: float4(1,0,1,1))  //Bottom Right
    ]
  }
}

class Cube_CustomMesh: CustomMesh {
  override func createVertices() {
    vertices = [
      //Left
      Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
      Vertex(position: float3(-1.0,-1.0, 1.0), color: float4(0.0, 1.0, 0.5, 1.0)),
      Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(0.0, 0.5, 1.0, 1.0)),
      Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
      Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
      Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(1.0, 0.0, 1.0, 1.0)),
      
      //RIGHT
      Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 0.0, 0.5, 1.0)),
      Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(0.0, 1.0, 0.0, 1.0)),
      Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(0.0, 0.5, 1.0, 1.0)),
      Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
      Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
      Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 0.5, 1.0, 1.0)),
      
      //TOP
      Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 0.0, 0.0, 1.0)),
      Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(0.0, 1.0, 0.0, 1.0)),
      Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(0.0, 0.0, 1.0, 1.0)),
      Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
      Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(0.5, 1.0, 1.0, 1.0)),
      Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(1.0, 0.0, 1.0, 1.0)),
      
      //BOTTOM
      Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
      Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(0.5, 1.0, 0.0, 1.0)),
      Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(0.0, 0.0, 1.0, 1.0)),
      Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 1.0, 0.5, 1.0)),
      Vertex(position: float3(-1.0,-1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
      Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 0.5, 1.0, 1.0)),
      
      //BACK
      Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
      Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(0.5, 1.0, 0.0, 1.0)),
      Vertex(position: float3(-1.0, 1.0,-1.0), color: float4(0.0, 0.0, 1.0, 1.0)),
      Vertex(position: float3( 1.0, 1.0,-1.0), color: float4(1.0, 1.0, 0.0, 1.0)),
      Vertex(position: float3( 1.0,-1.0,-1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
      Vertex(position: float3(-1.0,-1.0,-1.0), color: float4(1.0, 0.5, 1.0, 1.0)),
      
      //FRONT
      Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(1.0, 0.5, 0.0, 1.0)),
      Vertex(position: float3(-1.0,-1.0, 1.0), color: float4(0.0, 1.0, 0.0, 1.0)),
      Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(0.5, 0.0, 1.0, 1.0)),
      Vertex(position: float3( 1.0, 1.0, 1.0), color: float4(1.0, 1.0, 0.5, 1.0)),
      Vertex(position: float3(-1.0, 1.0, 1.0), color: float4(0.0, 1.0, 1.0, 1.0)),
      Vertex(position: float3( 1.0,-1.0, 1.0), color: float4(1.0, 0.0, 1.0, 1.0))
    ]
  }
}
