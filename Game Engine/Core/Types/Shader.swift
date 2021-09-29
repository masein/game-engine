//
//  Shader.swift
//  Game Engine
//
//  Created by Masein Mody on 29/09/2021.
//
import MetalKit

class Shader {
  var function: MTLFunction!
  init(name: String, functionName: String) {
    function = Engine.DefaultLibrary.makeFunction(name: functionName)
    function.label = name
  }
}
