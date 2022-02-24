
#include <metal_stdlib>
using namespace metal;

//This vertex should be the exact same as the one in the swift file.
struct VertexIn{
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
};

//We will use this rasterizer data model to send information to the rasterizer
struct RasterizerData{
    //Add the position attribute so it does not get interpolated by the rasterizer
    float4 position [[ position ]];
    //The color value will get interpolated since does not have an attribute tag
    float4 color;
};

struct ModelConstants{
    float4x4 modelMatrix;
};

struct SceneConstants{
    float4x4 viewMatrix;
    float4x4 projectionMatrix;
};
struct Material {
    float4 color;
    bool useMaterialColor;
};
vertex RasterizerData basic_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                          constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                          constant ModelConstants &modelConstants [[ buffer(2) ]]){
    RasterizerData rd;
    
    rd.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstants.modelMatrix * float4(vIn.position, 1);
    rd.color = vIn.color;
    
    return rd;
}

vertex RasterizerData instanced_vertex_shader(const VertexIn vIn [[ stage_in ]],
                                              constant SceneConstants &sceneConstants [[ buffer(1) ]],
                                              constant ModelConstants *modelConstants [[ buffer(2) ]],
                                              uint instanceId [[ instance_id ]]){
    RasterizerData rd;
    
    ModelConstants modelConstant = modelConstants[instanceId];
    
    rd.position = sceneConstants.projectionMatrix * sceneConstants.viewMatrix * modelConstant.modelMatrix * float4(vIn.position, 1);
    rd.color = vIn.color;
    
    return rd;
}

//Tbe fragment shaders purpose is to color in each fragment (pixel) to the color returned from the rasterizer.
fragment half4 basic_fragment_shader(RasterizerData rd [[ stage_in ]],
                                     constant Material &material [[ buffer(1) ]]){
    float4 color = material.useMaterialColor ? material.color : rd.color;
                                                        
    return half4(color.r, color.g, color.b, color.a);
}

