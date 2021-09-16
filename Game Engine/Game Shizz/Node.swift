//
//  Node.swift
//  Game Engine
//
//  Created by Masein Mody on 16/09/2021.
//
import MetalKit

class Node {
 
  func render(renderCommandEncoder: MTLRenderCommandEncoder) {
    if let renderable = self as? Renderable {
      renderable.doRender(renderCommandEncoder)
    }
  }
}
