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
}
class MeshLibrary {
  private static var meshes: [MeshTypes: Mesh] = [:]
  
  public static func Initialize() {
    createDefualtMeshes()
  }
  
  private static func createDefualtMeshes() {
    meshes.updateValue(Triangle_CustomeMesh(), forKey: .Triangle_Custom)
    meshes.updateValue(Quad_CustomMesh(), forKey: .Quad_Custom)
  }
  
  public static func Mesh(_ meshType: MeshTypes) -> Mesh {
    meshes[meshType]!
  }
}

protocol Mesh {
  var vertexBuffer: MTLBuffer! { get }
  var vertexCount: Int! { get }
}

class CustomMesh: Mesh {
  var vertices: [Vertex]!
  var vertexBuffer: MTLBuffer!
  var vertexCount: Int! {
    vertices.count
  }
  
  init() {
    createVertices()
    createBuffer()
  }
  
  func createVertices() { }
  
  func createBuffer() {
    vertexBuffer = Engine.Device.makeBuffer(bytes: vertices,
                                            length: Vertex.stride(vertices.count),
                                            options: [])
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
