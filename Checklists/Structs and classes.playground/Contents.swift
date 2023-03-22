import Cocoa

var firstNumber = 5
var secondNumber = firstNumber

print("[\(firstNumber), \(secondNumber)]")

secondNumber = 10

print("[\(firstNumber), \(secondNumber)]")

struct Student {
    var name: String
    var age: Int
}

var zhangsan = Student(name: "zhang san", age: 10)

var lisi = zhangsan

print("[\(zhangsan.name), \(zhangsan.age)]")
print("[\(lisi.name), \(lisi.age)]")

lisi.name = "lisi"
lisi.age = 20

print("[\(zhangsan.name), \(zhangsan.age)]")
print("[\(lisi.name), \(lisi.age)]")

class Person {
    var name: String = ""
    var age: Int = 0
}

var p1 = Person()
p1.name = "Apple"
p1.age = 15

var p2 = p1

print("[\(p1.name), \(p1.age)]")
print("[\(p2.name), \(p2.age)]")

p2.name = "Orange"
p2.age = 23

print("[\(p1.name), \(p1.age)]")
print("[\(p2.name), \(p2.age)]")
