//
//  ColorUtils.swift
//  Game Engine
//
//  Created by Masein Mody on 25/09/2021.
//
import simd

class ColorUtils {
  public static var randomColor: float4 {
    float4(Float.randomZeroToOne, Float.randomZeroToOne, Float.randomZeroToOne, 1.0)
  }
}
