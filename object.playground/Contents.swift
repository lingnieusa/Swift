import UIKit

class car{
    var name:String = "I am implicit initializer"
    var speed:Int = 1
    var afs = "ads"
    
    init(){
        name = name+"I am explicit constructor"
        speed = speed+3
    }

}

extension car{
    func start(){
        self.speed+=1
    }
}

func gas(vehicle:car){
    //vehicle.speed += 1
}


var car1:car = car()
print(car1.name)
car1 = .init()
print(car1.speed)
print(car1.afs)
//
//
//car1.name = "Honda"
//car1.start()
//gas(vehicle: car1)
//print(car1.speed)
