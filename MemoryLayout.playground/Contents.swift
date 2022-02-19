//https://www.youtube.com/watch?v=o-Ta5AIUSKM&list=PLXfSPWt0GzKD8TkC1VOGUbrLgHxq2n-BC

let mem=MemoryLayout<Bool>.self
mem.size
mem.stride
mem.alignment

struct GameBoard{
    var GameOver:Bool
    var p1Score:Int64
    var p2Score:Int32

}

let mem2=MemoryLayout<GameBoard>.self
MemoryLayout<Int64>.size
MemoryLayout<Int32>.size
MemoryLayout<Bool>.size
mem2.size
mem2.stride
mem2.alignment


let count = 4
let stride = MemoryLayout<CChar>.stride
let alignment = MemoryLayout<CChar>.alignment
let byteCount = stride * count
let mutableRawPtr = UnsafeMutableRawPointer.allocate (byteCount: byteCount, alignment: alignment)
defer {
mutableRawPtr.deallocate()
}
mutableRawPtr.storeBytes(of: 76, as: CChar.self)// L
mutableRawPtr.advanced(by: stride).storeBytes (of: 117, as: CChar.self)//I
mutableRawPtr.advanced (by: stride * 2) .storeBytes (of: 99, as: CChar.self)//U
mutableRawPtr.advanced (by: stride * 3).storeBytes (of: 0, as: CChar.self)//10

import Foundation
let rawBufferPointer = UnsafeRawBufferPointer(start: mutableRawPtr, count: byteCount)
    for (index, byte) in rawBufferPointer.enumerated(){
print("\(index): \(byte) ")
}
let mutablePtr = mutableRawPtr.bindMemory(to: CChar.self, capacity: count)
print(String(cString: mutablePtr))

// Reading from stdin
let inputCapacity = 30
let input = UnsafeMutablePointer<CChar>.allocate(capacity: inputCapacity)
defer {
input.deallocate()
}
print("Enter text:",terminator:"")
fgets(input, Int32(inputCapacity), stdin)
print (String(cString: input))
