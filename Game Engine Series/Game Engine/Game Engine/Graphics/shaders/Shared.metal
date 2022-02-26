#include <metal_stdlib>
using namespace metal;

struct VertexIn{
    float3 position [[ attribute(0) ]];
    float4 color [[ attribute(1) ]];
    float2 texturecoordinate [[ attribute(2) ]];
};

struct RasterizerData{
    float4 position [[ position ]];
    float4 color;
    float2 texturecoordinate;
    float totalGametime;
};

struct ModelConstants{
    float4x4 modelMatrix;
};

struct SceneConstants{
    float totalgameTime;
    float4x4 viewMatrix;
    float4x4 projectionMatrix;

};

struct Material {
    float4 color;
    bool useMaterialColor;
};
