import MetalKit


class SandboxScene:Scene{
    var debugCamera = DebugCamera()
    
    override func buildScene() {
        addCamera(debugCamera)
        
        for y in -5..<5{
            for x in -5..<5{
                let pointer = Pointer(camera: debugCamera)
                pointer.position.y = Float(Float(y) + 0.5) / 5
                pointer.position.x = Float(Float(x) + 0.5) / 5
                pointer.scale = float3(0.1, 0.1, 0.1)
                addChild(pointer)
            }
        }
    }
    
//    override func update(deltaTime: Float) {
//        for child in children{
//            child.rotation.z += 0.02
//        }
//        super.update(deltaTime: deltaTime)
//    }
    
}
