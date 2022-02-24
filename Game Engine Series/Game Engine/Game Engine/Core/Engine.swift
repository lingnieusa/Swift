import MetalKit

class Engine {
    
    public static var Device: MTLDevice!
    public static var CommandQueue: MTLCommandQueue!
    
    public static func Ignite(device: MTLDevice!){
        self.Device = device

        self.CommandQueue = device.makeCommandQueue()
        
        ShaderLibrary.initialize()
        
        VertexDescriptorLibrary.intialize()
        
        DepthStencilStateLibrary.Intitialize()
        
        RenderPipelineDescriptorLibrary.initialize()
        
        RenderPipelineStateLibrary.initialize()
        
        MeshLibrary.Initialize()
        
        SceneManager.Initialize(Preferences.StartingSceneType)
        
    }
    
}
