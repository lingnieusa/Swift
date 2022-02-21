import UIKit

class car{
    var name:String!
    var speed:Int = 0

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
car1.name = "Honda"
car1.start()
gas(vehicle: car1)
print(car1.speed)
