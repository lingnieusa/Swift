import MetalKit


class SandboxScene:Scene{
    var debugCamera = DebugCamera()
    var cube = Cube()
    override func buildScene() {
        addCamera(debugCamera)
        
        debugCamera.position.z = 60
        
        addCubes()
//        addCamera(debugCamera)
//
//        for y in -5..<5{
//            for x in -5..<5{
//                let pointer = Pointer(camera: debugCamera)
//                pointer.position.y = Float(Float(y) + 0.5) / 5
//                pointer.position.x = Float(Float(x) + 0.5) / 5
//                pointer.scale = float3(0.1, 0.1, 0.1)
//                addChild(pointer)
//            }
//        }
    }
    
    var cubeCollection: CubeCollection!
    func addCubes(){
        
        cubeCollection = CubeCollection(cubesWide: 20, cubesHigh: 20, cubesBack: 20)
        addChild(cubeCollection)
    }
    override func update(deltaTime: Float) {
        cubeCollection.rotation.z += deltaTime
        cubeCollection.position.x = 12
        super.update(deltaTime: deltaTime)
    }
//    override func update(deltaTime: Float) {
//        for child in children{
//            child.rotation.z += 0.02
//        }
//        super.update(deltaTime: deltaTime)
//    }
//    func addCubes(){
//        for y in -5..<5 {
//            let posY = Float(y) + 0.5
//            for x in -8..<8 {
//                let posX = Float(x) + 0.5
//                let cube = Cube()
//                cube.position.y = posY
//                cube.position.x = posX
//                cube.scale = float3(0.3, 0.3, 0.3)
//                cube.setColor(ColorUtil.randomColor)//
//                addChild(cube)
//            }
//        }
//    }
    
//    override func update(deltaTime: Float) {
//        for child in children{
//            child.rotation.x += deltaTime
//            child.rotation.y += deltaTime
//        }
//
//        super.update(deltaTime: deltaTime)
//    }
}
