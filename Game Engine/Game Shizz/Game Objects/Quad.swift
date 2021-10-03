//
//  Quad.swift
//  Game Engine
//
//  Created by Masein Mody on 29/09/2021.
//
import simd

class Quad: GameObject {
  
  init() {
    super.init(meshType: .Quad_Custom)
    setName("Quad")
  }
}
