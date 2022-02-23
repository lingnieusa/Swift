import MetalKit


class Scene:Node{
    var cameraManager = CameraManager()//keyin
    var sceneConstants = SceneConstants()//4x4
//    var camera = DebugCamera()
    
    override init(){
        super.init()
        buildScene()
    }
    
    func buildScene() { }
    
    func addCamera(_ camera: Camera, _ isCurrentCamera: Bool = true){
        cameraManager.registerCamera(camera: camera)
        if(isCurrentCamera){
            cameraManager.setCamera(camera.cameraType)
        }
    }
    
    func updateSceneConstants(){
        sceneConstants.viewMatrix = cameraManager.currentCamera.viewMatrix
    }
    func updateCameras(deltaTime: Float){
        cameraManager.update(deltaTime: deltaTime)
    }
    override func update(deltaTime: Float) {
        updateSceneConstants()
        super.update(deltaTime: deltaTime)
    }
    
    override func render(renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setVertexBytes(&sceneConstants, length: SceneConstants.stride, index: 1)
        super.render(renderCommandEncoder: renderCommandEncoder)
    }
    
}
