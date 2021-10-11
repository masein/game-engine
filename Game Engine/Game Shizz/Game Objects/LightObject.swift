//
//  LightObject.swift
//  Game Engine
//
//  Created by Masein Mody on 10/10/2021.
//
import MetalKit

class LightObject: GameObject {
  var lightData = LightData()
  
  init(name: String) {
    super.init(meshType: .None)
    setName(name)
  }
  
  init(meshType: MeshTypes, name: String) {
    super.init(meshType: meshType)
    setName(name)
  }
  
  override func update() {
    lightData.position = getPosition()
    super.update()
  }
}
