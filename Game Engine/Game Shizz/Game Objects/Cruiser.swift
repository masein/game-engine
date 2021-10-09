//
//  Cruiser.swift
//  Game Engine
//
//  Created by Masein Mody on 09/10/2021.
//
import MetalKit

class Cruiser: GameObject {
  init() {
    super.init(meshType: .Cruiser)
    setName("Cruiser")
    setTexture(.Cruiser)
  }
}
