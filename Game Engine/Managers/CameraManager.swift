//
//  CameraManager.swift
//  Game Engine
//
//  Created by Masein Mody on 21/09/2021.
//
class CameraManager {
  private var _cameras: [CameraTypes: Camera] = [:]
  public var currentCamera: Camera!
  
  public func registerCamera(camera: Camera) {
    _cameras.updateValue(camera, forKey: camera.cameraType)
  }
  
  public func setCamera(_ cameraType: CameraTypes) {
    currentCamera = _cameras[cameraType]
  }
  
  internal func update(deltaTime: Float) {
    for camera in _cameras.values {
      camera.update(deltaTime: deltaTime)
    }
  }
}
