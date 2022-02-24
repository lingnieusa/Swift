import MetalKit

class Cube: GameObject {

    init(){
        super.init(meshType: .Cube_Custom)
    }
    
    var deltax = (Float.randomZeroToOne*0.02)
    var deltay = (Float.randomZeroToOne*0.02)
    override func update(deltaTime: Float) {
        self.rotation.x = self.rotation.x+deltax
        self.rotation.y = self.rotation.x+deltay
        super.update(deltaTime: deltaTime)
    }
    
}
