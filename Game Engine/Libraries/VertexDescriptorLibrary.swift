//
//  VertexDescriptorLibrary.swift
//  Game Engine
//
//  Created by Masein Mody on 12/09/2021.
//
import MetalKit

enum VertexDescriptorTypes {
  case Basic
}

class VertexDescriptorLibrary {
  private static var vertexDescriptors: [VertexDescriptorTypes: VertexDescriptor] = [:]
  
  public static func Initialize() {
    createDefaultVertexDescriptor()
  }
  
  public static func createDefaultVertexDescriptor() {
    vertexDescriptors.updateValue(Basic_VertexDescriptor(), forKey: .Basic)
  }
  
  public static func Desciptor(_ vertexDescriptorType: VertexDescriptorTypes) -> MTLVertexDescriptor {
    return vertexDescriptors[vertexDescriptorType]!.vertexDescriptor
  }
}

protocol VertexDescriptor {
  var name: String { get }
  var vertexDescriptor: MTLVertexDescriptor { get }
}

public struct Basic_VertexDescriptor: VertexDescriptor {
  var name: String = "Basic Vertex Descriptor"
  var vertexDescriptor: MTLVertexDescriptor {
    let vertexDescriptor = MTLVertexDescriptor()
    // position
    vertexDescriptor.attributes[0].format = .float3
    vertexDescriptor.attributes[0].bufferIndex = 0
    vertexDescriptor.attributes[0].offset = 0
    // color
    vertexDescriptor.attributes[1].format = .float4
    vertexDescriptor.attributes[1].bufferIndex = 0
    vertexDescriptor.attributes[1].offset = float3.size
    vertexDescriptor.layouts[0].stride = Vertex.stride
    return vertexDescriptor
  }
}
