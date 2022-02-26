
#include <metal_stdlib>
#include "Shared.metal"
using namespace metal;

vertex RasterizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                          constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                          constant ModelConstants &modelConstants [[ buffer(2) ]]){
    RasterizerData rd;
    
    rd.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstants.modelMatrix * float4(vIn.position, 1);
    rd.color = vIn.color;
    rd.texturecoordinate = vIn.texturecoordinate;
    rd.totalGametime = sceneConstants.totalgameTime;
    return rd;
}

fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]],
                                     constant Material &material [[ buffer(1) ]]){
    //float4 color = material.useMaterialColor ? material.color : rd.color;
    float2 texCoord = rd.texturecoordinate;
    float gametime = rd.totalGametime;
    
    float4 color = float4(sin((texCoord.x+gametime)*10),sin((texCoord.y+gametime)*10),sin((gametime)),1);
    return half4(color.r, color.g, color.b, color.a);
}

