//
//  Sun.swift
//  Game Engine
//
//  Created by Masein Mody on 11/10/2021.
//
import simd

class Sun: LightObject {
  init() {
    super.init(meshType: .Sphere, name: "Sun")
    setMaterialColor(float4(0.5, 0.5, 0, 1.0))
    setScale(0.3)
  }
}
