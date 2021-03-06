//: [Previous](@previous)
//: ### Raw Values
//: - Callout(Exercise):
//: What's the raw value for `SecretLetters.g`?
//:
enum SecretLetters: Int {
    case a, b = 6, c, d, e, f = 2, g
}

print(SecretLetters.a.rawValue)
print(SecretLetters.b.rawValue)
print(SecretLetters.c.rawValue)
print(SecretLetters.d.rawValue)
print(SecretLetters.e.rawValue)
print(SecretLetters.f.rawValue)
print(SecretLetters.g.rawValue)
//: - Callout(Exercise):
//: Define an enum called `Rotation` with cases for `quarter`, `half`, `threeQuarter`, and `full` rotations. Each case should specify a raw value that represents the number of degrees for the rotation. For example, an eighth (1/8 * 360) turn would be 45 degrees.
//:
enum Rotation: Int {
    case quarter = 90
    case half = 180
    case threeQuarter = 270
    case full = 360
}
//: [Next](@next)
