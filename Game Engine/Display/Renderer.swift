//
//  Renderer.swift
//  Game Engine
//
//  Created by Masein Mody on 15/09/2021.
//
import MetalKit

class Renderer: NSObject {
  var player = Player()
}

extension Renderer: MTKViewDelegate {
  func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    // when the window is resized
  }
  
  func draw(in view: MTKView) {
    guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
    let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
    let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
    player.render(renderCommandEncoder: renderCommandEncoder!)
    renderCommandEncoder?.endEncoding()
    commandBuffer?.present(drawable)
    commandBuffer?.commit()
  }
}