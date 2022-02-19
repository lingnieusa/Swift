class Car{
    var color:String
    required init(color:String){
        self.color=color
        //print("car created")
    }
    func printme(){
        print(color)
    }
}

class bmw : Car{
    required init(color:String){
        super.init(color:color)
        //print("bmw created")
    }
}

var x1 = bmw(color: "white")

