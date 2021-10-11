//
//  Camera.swift
//  Game Engine
//
//  Created by Masein Mody on 21/09/2021.
//
import simd

enum CameraTypes {
  case Debug
}

class Camera: Node {
  var cameraType: CameraTypes!
  
  var viewMatrix: matrix_float4x4 {
    var viewMatrix = matrix_identity_float4x4
    viewMatrix.rotate(angle: getRotationX(), axis: X_AXIS)
    viewMatrix.rotate(angle: getRotationY(), axis: Y_AXIS)
    viewMatrix.rotate(angle: getRotationZ(), axis: Z_AXIS)
    viewMatrix.translate(direction: -getPosition())
    return viewMatrix
  }
  
  var projectionMatrix: matrix_float4x4 {
    return matrix_identity_float4x4
  }
  
  init(cameraType: CameraTypes){
    super.init(name: "Camera")
    self.cameraType = cameraType
  }
}
