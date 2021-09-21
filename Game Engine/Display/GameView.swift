//
//  GameView.swift
//  Game Engine
//
//  Created by Masein Mody on 29/08/2021.
//
import MetalKit

class GameView: MTKView {
  var renderer: Renderer!
  
  required init(coder: NSCoder) {
    super.init(coder: coder)
    device = MTLCreateSystemDefaultDevice()
    Engine.Ignite(device: device!)
    clearColor = Preferences.ClearColor
    colorPixelFormat = Preferences.MainPixelFormat
    renderer = Renderer(self)
    delegate = renderer
  }
}

extension GameView {
  override var acceptsFirstResponder: Bool { return true }
  
  override func keyDown(with event: NSEvent) {
    Keyboard.SetKeyPressed(event.keyCode, isOn: true)
  }
  
  override func keyUp(with event: NSEvent) {
    Keyboard.SetKeyPressed(event.keyCode, isOn: false)
  }
}

extension GameView {
  override func mouseDown(with event: NSEvent) {
    Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
  }
  
  override func mouseUp(with event: NSEvent) {
    Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
  }
  
  override func rightMouseDown(with event: NSEvent) {
    Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
  }
  
  override func rightMouseUp(with event: NSEvent) {
    Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
  }
  
  override func otherMouseDown(with event: NSEvent) {
    Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: true)
  }
  
  override func otherMouseUp(with event: NSEvent) {
    Mouse.SetMouseButtonPressed(button: event.buttonNumber, isOn: false)
  }
}

extension GameView {
  override func mouseMoved(with event: NSEvent) {
    setMousePositionChanged(event: event)
  }
  
  override func scrollWheel(with event: NSEvent) {
    Mouse.ScrollMouse(deltaY: Float(event.deltaY))
  }
  
  override func mouseDragged(with event: NSEvent) {
    setMousePositionChanged(event: event)
  }
  
  override func rightMouseDragged(with event: NSEvent) {
    setMousePositionChanged(event: event)
  }
  
  override func otherMouseDragged(with event: NSEvent) {
    setMousePositionChanged(event: event)
  }
  
  private func setMousePositionChanged(event: NSEvent){
    let overallLocation = float2(Float(event.locationInWindow.x),
                                 Float(event.locationInWindow.y))
    let deltaChange = float2(Float(event.deltaX),
                             Float(event.deltaY))
    Mouse.SetMousePositionChange(overallPosition: overallLocation,
                                 deltaPosition: deltaChange)
  }
  
  override func updateTrackingAreas() {
    let area = NSTrackingArea(rect: bounds,
                              options: [NSTrackingArea.Options.activeAlways,
                                        NSTrackingArea.Options.mouseMoved,
                                        NSTrackingArea.Options.enabledDuringMouseDrag],
                              owner: self,
                              userInfo: nil)
    addTrackingArea(area)
  }
  
}
