//: Playground - noun: a place where people can play

import UIKit

for i in 5...9 {
    print("\(i)")
}

for p in ["s":8, "ant":6] {
    print(p);
}

for var i = 0 ; i < 4 ; i++ {
    print("\(i)");
}

var j:Int = 0;
repeat {
    print(j);
} while j++ < 5

while j-- > 0 {
    print(j);
}

if 1 == 1 && 2 == 2{
    print(111_111)
}

//if条件判断可选类型并赋值，如下。如果可选变量为nil，则条件语句为false；如果不为nil，则打开可选变量并赋值给另一个变量，该变量只在if语句块中有效
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
//当在单个if中绑定多个值时，可以使用where子句。只有当所有可选变量都有值，且条件都满足时，才为true，并赋值。不能用&&。
var optionalHello: String? = "Hello"
if let hello = optionalHello where hello.hasPrefix("H"), let name = optionalName {
    greeting = "\(hello), \(name)"
}


let char:String = "a";
switch char {
case "a", "e", "i" :
    print("vowel");
    fallthrough; //继续
case  "w", "q":
    print("conscount");
default:
    print("none");
}

let point3D = (0,2,3);
switch point3D {
case (let x, 2,4):
    print(x);
case (0, var x, var y):
    print(y,x);
case let (x,y,z):
    print(x,y,z);
}

switch point3D {
case let (x, y, _) where x<5 && y > -10 :
    print(x, y);
case let (x, y, _) where x == y :
    print(x);
default:
    print(0);
}
//switch中的where不同于if，只要逗号分隔的一个语句满足，就赋值并执行。
//当case中使用fallthrough时，不可以用where变量赋值
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}


var k:Int = 0;
lb:while k<10 {
    print(k)
    if (true) {
       
         k++
        while k<5{
            print("a")
            break lb;
//            continue lb;
        }
       
    }
}
