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

extension LightObject {
  // Light Color
  public func setLightColor(_ color: float3) { lightData.color = color }
  public func getLightColor() -> float3 { return lightData.color }
  
  // Light Brightness
  public func setLightBrightness(_ brightness: Float) { lightData.brightness = brightness }
  public func getLightBrightness() -> Float { return lightData.brightness }
  
  // Ambient Intensity
  public func setLightAmbientIntensity(_ intensity: Float) { lightData.ambientIntensity = intensity }
  public func getLightAmbientIntensity() -> Float { return lightData.ambientIntensity }
}
