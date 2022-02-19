protocol vin{
    func printme()
    static var count: Int { get set }
}

class car:vin{
    
    static var count = 0
    let color:String
    
    required init(color:String){
        self.color=color
        car.count += 1
    }
}

extension car{
    func printme(){
        print("I have \(car.count) cars")
    }
}

class honda:car{
    let brand:String="honda"
    var style:String!
}

class ford:car{
    let brand:String="ford"
    var style:String!
}

let my1car:car=honda(color: "blue")
let my2car:car=ford(color: "Red")

my2car.printme()


