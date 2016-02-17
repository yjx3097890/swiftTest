//协议(类似接口)
//类，枚举或结构体可以遵守（conform）协议
//class SomeClass: SuperClass, Protocol1, Protocol2 {
//}

//协议中的属性,限定实例属性和类属性（static修饰）的名称和类型
//如果协议要求属性是可读写的，则这个属性不能是常量存储属性和只读计算属性
//如果要求属性是只读的，则实现中可以是任何属性。只有类型转换为该协议时，写方法才会失效。
//只能用var声明，后面指明{set get}和{get}
protocol Pro1 {
    var bb: Int {set get};
    var ss:String{get};
    static var cc: Int{get set};
}
class Pro1Class: Pro1 {
    var bb:Int;
    var ss:String {
        get {
            print("get ss");
            return "A";
        }
        set {
            print("set ss");
        }
    }
    static var cc: Int = 3;
    init (bb: Int, cc: Int) {
        self.bb = bb;
    }
    
}
var p1 = Pro1Class(bb: 2, cc: 3);
p1.ss = "s";
print(p1.ss )
var p11 = p1 as Pro1;
//p11.ss = "aa";


//协议中的方法，不需要大括号方法体，支持变长参数，不支持默认参数。
//如果需要在方法中改变self的值，需要用mutating修饰。
protocol Pro2 {
    func meth1(val1: String) -> Int;
    static func meth2(val2: String) -> String;
    mutating func meth2(val: Int);
}

//协议扩展实现
//如果一个类型中已经实现了协议的要求，但没有声明。扩展可以补充协议声明（大括号中可以为空）。
protocol Pro3 {
    func asText() -> String;
}
extension Int : Pro3 {
    func asText() -> String {
        return "as"
    }
}
2.asText();

let arr: [Pro3] = [];

//继承：协议可以继承一个或多个其他协议。语法和类继承一样。
protocol Pro4: Pro3 {
    func asPrettyText() -> String;
}

//协议合成:多个协议生成一个临时类型 protocol<Pro1, Pro2>
protocol Named {
    var name: String{get}
}
protocol Aged {
    var age: Int{get}
}
struct Person:Named, Aged  {
    var name:String;
    var age: Int;
}
func birthday (celebrator: protocol<Named, Aged>) {
    print(celebrator.name, celebrator.age);
}
birthday(Person(name:"yjx", age: 1))
//校验协议
//is 用于检测实例是否遵守某个协议
//as 将实例转换为某个协议类型
//as? 返回协议的可选类型。当实例遵守某协议时， 返回该协议类型的实例，否则返回nil
//as! 强制转型
import Foundation
@objc protocol HasArea {
    var area: Double{get}
}
//@obj 表示可选协议，也可以表示暴露给objective-C的代码。@objc声明的协议只对类有效
class Circle: HasArea {
    var radius: Double;
    @objc var area: Double{
        return radius * radius * 3.14;
    };
    init (radius: Double) {
        self.radius = radius;
    }
}
class Country: HasArea {
    @objc var area: Double;
    init (area: Double) {
        self.area = area;
    }
}

let objs: [Any] = [
    Circle(radius: 2.3),
    Country(area: 22.3),
    Person(name: "hh", age: 2)
];
for obj in objs {
    if let areaobj:HasArea = obj as? HasArea {
        print(areaobj.area)
    } else {
        print("no")
    }
}
var ae = objs[0] as? HasArea
print(ae!.area);

//可选成员, optional指定可选择实现的属性和方法。
//可选成员只能在有@objc声明的协议中
@objc protocol DataSource {
    optional func inc (count: Int) -> Int;
    optional var fixInc : Int {get};
}
class Counter {
    var count = 0;
    var dataSource: DataSource;
    func increment () {
        if let amount = dataSource.inc?(count) {
            count += amount;
        }
    }
    init (dataSource: DataSource) {
        self.dataSource = dataSource;
    }
}

//委托（代理）：定义协议封装那些需要被委托的方法，其实现者拥有这些被委托的方法。代理类和真实类应该要遵守相同的协议，这样真实类的地方都可以替换为代理类，以控制真实类的访问。
protocol RandomNumber {
    func random() -> Double;
}
//骰子
class Dice {
    let sides : Int;
    let generator: RandomNumber;
    init (sides: Int, generator: RandomNumber) {
        self.sides = sides; self.generator = generator;
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1;
    }
}
//骰子游戏
protocol DiceGame {
    var dice: Dice{get}
    func play();
}
//追踪游戏过程
protocol DiceGameDelegate {
    func gameStart (game: DiceGame);
    func gane(game: DiceGame, startnewturn diceRoll: Int);
    func gameEnd (game: DiceGame);
}
class LinearGenerator: RandomNumber {
    func random() -> Double {
        return random();
    }
}
class snakeAndLeader: DiceGame {
    let finalSquare = 25;
    let dice = Dice(sides: 6, generator: LinearGenerator());
    var square = 0;
    var board: [Int];
    init() {
        board = Array<Int>(count: finalSquare+1, repeatedValue: 0);
    }
    var delegate: DiceGameDelegate?;
    func play() {
        print("play");
    }
    
    
}

