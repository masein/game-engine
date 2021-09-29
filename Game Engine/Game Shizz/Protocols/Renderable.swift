//
//  Renderable.swift
//  Game Engine
//
//  Created by Masein Mody on 16/09/2021.
//
import MetalKit

protocol Renderable {
  func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder)
}
