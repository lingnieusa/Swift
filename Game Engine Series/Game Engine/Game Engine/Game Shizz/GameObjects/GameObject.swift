import MetalKit

class GameObject: Node {
    
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
        renderCommandEncoder.setVertexBytes(&modelConstants, length: ModelConstants.stride, index: 1)
        renderCommandEncoder.setRenderPipelineState(RenderPipelineStateLibrary.PipelineState(.Basic))
        renderCommandEncoder.setVertexBuffer(mesh.vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: mesh.vertexCount)
    }
}
