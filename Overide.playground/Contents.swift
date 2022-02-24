import UIKit

class Person{
    var age:Float = 0
    var children: [Person] = []
    func addChild(_ child: Person){
        children.append(child)
    }
    func update(){
        for child in children{
            print("Person:update")
            print(type(of: child))
            child.get()
            

        }
    
    }
    func get(){
        print("Person:get")
    }
}

class Female:Person{
    override func update(){
        print("Female:update")
    }
    override func get(){
        print("Female:get")
    }
}

class Girl:Female{


//    override func update(){
//        print("Girl:update")
//    }
//    override func get(){
//        print("Girl:get")
//    }
}

class Male:Person{
    var person = initia1()
    override init(){
        print("initializer:Male")
        super.init()
        build()
    }
    
    func build() {print("Male:build\n") }
//    override func update(){
//        print("Male:update")
//    }
}

class Boy:Male{
    var initia = initia2()
    override func build() {
        for x in 1..<3{
            var player = Girl()
            player.age = Float(x)
            addChild(player)
            print("Girl \(x)")
        }
    }
    override func update() {
        for child in children{
            child.age += 0.02
            print("Boy update \(child.age)")
        }
        super.update()
    }
    
}
class initia1{
    init(){
        print("initializer1")
    }
}
class initia2{
    init(){
        print("initializer2")
    }
}
class SceneManager{
    private static var _currentScene:Person!

    public static func Initialize(){
        _currentScene = Boy()
    }
    
    public static func TickScene(){
        
        _currentScene.update()
        
        //_currentScene.render()
        
    }
}

SceneManager.Initialize()
SceneManager.TickScene()

