//
//  Keyboard.swift
//  Game Engine
//
//  Created by Masein Mody on 20/09/2021.
//
class Keyboard {
  private static var KEY_COUNT: Int = 256
  private static var keys = [Bool].init(repeating: false, count: KEY_COUNT)
  
  public static func SetKeyPressed(_ keyCode: UInt16, isOn: Bool) {
   keys[Int(keyCode)] = isOn
  }
  
  public static func IsKeyPressed(_ keyCode: KeyCodes) -> Bool {
    keys[Int(keyCode.rawValue)]
  }
}
