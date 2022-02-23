import MetalKit


class Scene:Node{
    var sceneConstants = SceneConstants()//4x4
    var camera = DebugCamera()//keyin
    
    override init(){
        super.init()
        buildScene()
    }
    
    func buildScene() { }
    
    func updateSceneConstants(){
        sceneConstants.viewMatrix = camera.viewMatrix
    }
    
    override func update(deltaTime: Float) {
        camera.update(deltaTime: deltaTime)
        updateSceneConstants()
        super.update(deltaTime: deltaTime)
    }
    
    override func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&sceneConstants, length: SceneConstants.stride, index: 1)
        super.render(renderCommandEncoder: renderCommandEncoder)
    }
    
}
