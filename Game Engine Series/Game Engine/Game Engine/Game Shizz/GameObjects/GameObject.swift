import MetalKit

class GameObject: Node {
    private var material = Material()
    var modelConstants = ModelConstants()//4x4
    var mesh: Mesh!//vertices dictionary
    
    init(meshType: MeshTypes) {
        mesh = MeshLibrary.Mesh(meshType)
    }
    
//    var time:Float = 0
    override func update(deltaTime:Float){
//        time += deltaTime
//        self.rotation = float3(0,0,20*time)
//        self.position = float3(cos(time)-sin(time),sin(time)*cos(time),1)
        //self.scale = float3(repeating: cos(time))

        updateModelConstants()
    }
    
    private func updateModelConstants(){
        modelConstants.modelMatrix = self.modelMatrix
    }
    
}



extension GameObject: Renderable{
    func doRender(_ renderCommandEncoder: MTLRenderCommandEncoder) {
        renderCommandEncoder.setDepthStencilState(DepthStencilStateLibrary.DepthStencilState(.Less))
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        //Vertex Shader
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 2)
        
        //Fragment Shader
        renderCommandEncoder.setFragmentBytes(&material, length: Material.stride, index: 1)
        
        mesh.drawPrimitives(renderCommandEncoder)
    }
}

//Material Properties
extension GameObject {
    public func setColor(_ color: float4){
        self.material.color = color
        self.material.useMaterialColor = true
    }
}
