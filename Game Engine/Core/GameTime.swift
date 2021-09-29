//
//  GameTime.swift
//  Game Engine
//
//  Created by Masein Mody on 29/09/2021.
//
import MetalKit

class GameTime {
  private static var _totalGameTime: Float = 0.0
  private static var _deltaTime: Float = 0.0
  public static func UpdateTime(_ deltaTime: Float) {
    _deltaTime = deltaTime
    _totalGameTime += deltaTime
  }
}

extension GameTime {
  public static var TotalGameTime: Float {
    _totalGameTime
  }
  
  public static var DeltaTime: Float {
    _deltaTime
  }
}
