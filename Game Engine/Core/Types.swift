//
//  Types.swift
//  Game Engine
//
//  Created by Masein Mody on 08/09/2021.
//
import simd

protocol sizeable {
}

extension sizeable {
  static var size: Int {
    return MemoryLayout<Self>.size
  }
  static var stride: Int {
    return MemoryLayout<Self>.stride
  }
  static func size(_ count: Int) -> Int {
    return MemoryLayout<Self>.size * count
  }
  static func stride(_ count: Int) -> Int {
    return MemoryLayout<Self>.stride * count
  }
}

extension float3: sizeable {  }

extension float4: sizeable {  }

struct Vertex: sizeable {
  var position: float3
  var color: float4
}
