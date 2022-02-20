import MetalKit

class GameObject{
    var vertexBuffer: MTLBuffer!
    var vertices: [Vertex]!
    init(){
        createVertices()
        createBuffers()
    }
    
    func createVertices(){
        vertices = [
            Vertex(position: float3( 0, 1,0), color: float4(1,0,0,1)),
            Vertex(position: float3(-1,-1,0), color: float4(0,1,0,1)),
            Vertex(position: float3( 1,-1,0), color: float4(0,0,1,1))
        ]
    }
    
    func createBuffers(){
        vertexBuffer = Engine.Device?.makeBuffer(bytes: vertices, length: Vertex.stride(vertices.count), options: [])
    }
    
    func render(renderCommandEncoder: MTLRenderCommandEncoder!){
        renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderCommandEncoder?.drawPrimitives(type: .triangle, vertexStart: 0, vertexCount: vertices.count)
    }
    
}
