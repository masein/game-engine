//
//  Renderer.swift
//  Game Engine
//
//  Created by Masein Mody on 15/09/2021.
//
import MetalKit

class Renderer: NSObject {
}

extension Renderer: MTKViewDelegate {
  func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
    // when the window is resized
  }
  
  func draw(in view: MTKView) {
    guard let drawable = view.currentDrawable, let renderPassDescriptor = view.currentRenderPassDescriptor else { return }
    let commandBuffer = Engine.CommandQueue.makeCommandBuffer()
    let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
    SceneManager.TikScene(renderCommandEncoder: renderCommandEncoder!, deltaTime: 1/Float(view.preferredFramesPerSecond))
    renderCommandEncoder?.endEncoding()
    commandBuffer?.present(drawable)
    commandBuffer?.commit()
  }
}
