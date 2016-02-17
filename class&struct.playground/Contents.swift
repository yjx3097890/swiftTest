//: Playground - noun: a place where people can play

//已知只有类和闭包是引用类型。
//枚举，数组和字典都属于结构体，因此都是值类型。变量传递时，直接复制。
//因此结构体适合定义轻量级的数据类型，没有继承和类型转换的功能。
struct Resolution {
    lazy var width = 100;
    let height = 1000;
    func a () ->String {
        return "a";
    }
}

class Vedio {
    let resolution = Resolution(width: 100);  //多个参数，初始化顺序必须和声明的一样
    var name = "cctv";
}

let v1 =  Vedio();
v1.name;
// v1.resolution.width = 10;  //不能改

let v2 =  Vedio();

v1 === v2; //判断引用，只能用===

//存储属性
//对于值类型的常量，其内部属性也不可改变。引用类型内部成员不受影响
struct Range {
    var value: Int;
    let length: Int;
}


var r1 = Range(value: 2, length:3);
r1.value = 0;
print(r1);

//惰性存储属性，第一次访问时，才初始化
//lazy 不能用于let
class Importer {
    var file = "aa.txt";
    func process() -> String {
        print("process");
        return "data.txt";
    }
}
class Manager {
    lazy var importer = Importer().process();
    var data = [String]();
    
}

let mag = Manager();
mag.data += ["data"];
print(mag.data);
print(mag.importer)

//可读写的计算属性,也不能用let
struct Point {
    var x = 0.0, y=0.0;
}
struct Size {
    var height=0.0, width = 0.0;
}
struct Rect {
    var origin:Point = Point();
    var size = Size();
    var center: Point {
        get {
            let cx = origin.x + (size.width/2);
            let cy = origin.y + size.height/2;
            return Point(x: cx, y: cy);
        }
//        set {
//            origin.x = newValue.x - size.width/2;
//            origin.y = newValue.y - size.height / 2;
//        }
    }
}

var square = Rect(origin: Point(x: 1, y: 2), size: Size(height: 11.4, width: 11));
print(square.center)

//只读计算属性，也不能用let
class Cube {
    var width = 1.3, height:Double = 1.4, dep:Double = 2;
    var volume:Double {
        return width * height * dep;
    }
}
var cb = Cube();
cb.volume;

//属性观察器
//不能和get，set一起用
class Step {
    var total:Int = 0 {
        willSet (aa) {
            print(aa)
        }
        didSet (old) {
            print(old);
        }
        
    }
    
}
let st = Step();
st.total = 2;

//属性观察器和get、set对于全局变量也适用
var total:Int = 0 {
    willSet (aa) {
        print(aa)
    }
    didSet (old) {
        print(old);
    }

}

//静态属性
//枚举和结构体用static修饰，类用class修饰。
struct Structure1 {
    static var ctp:String {
        return "hello";
    }
    static let ty : Int = 30;
}
print(Structure1.ctp);
enum em1 {
    static var ctp:String {  //可以省略set，get必须有
        get {
         return "hello";   
        }
    }
    static let ty : Int = 30;
}

//静态属性中不能访问非静态属性
//非静态属性中可以访问静态属性
class class1 {
    var val = "ss" {
        willSet {
            print(class1.ss);
        }
    };
    static var ss:Double = 1;
    class var read:Int {
        return 33;
    }
    
}
var c1 = class1()
c1.val = "qq";
print(class1.read);

//方法
class Computer {
    var count:Int = 0;
    func incrment () {
        count++;
    }
   func incrmentBy(am amount:Int) -> Int {
        var count = 11;
        self.count += amount;
        return count++;
    }
}
var counter = Computer();
counter.incrmentBy(am: 1);

//mutating 使结构体和枚举的属性（包括self）可以在方法中修改
struct Pt {
    var x = 0, y = 0;
    mutating func moveBy(deltaX: Int, deltaY: Int) {
        x += deltaX;
        y += deltaY;
        self = Pt(x: 2, y: 3);
    }
}
var pt = Pt();
pt.x += 3;

//类型方法（静态方法） 在方法前加static（结构体和类），方法中self指向该类。
struct struct2 {
    var x = 1;
    static var y = 2;
    static func mothod(z:Int) {
        self.y = z;
    }
}

//构造器, 没有func，名字都为init，可以重载, 不能用mutating修饰
class Celsius {
    var temp = 0.0;
    init(fromF f: Double) {
        temp = f;
    }
    init(fromK k:Double) {
        temp += k;
    }
}
var cel1 = Celsius(fromF: 1.2);
var cel2 = Celsius(fromK: 1.2);

//默认构造器
//类构造器只需要初始化在声明时没有赋值的变量。
//调用构造器时需要写上所有的参数名字
class Shopping {
    var name:String?;
    var quantity = 1;
    var purchased = false;
}
var shop = Shopping(); //函数默认构造器没有参数


struct Size1 {
    var x = 0 , y = 0;
}
var s1 = Size1()
var s2 = Size1(x: 2, y: 2);  //结构体的默认构造器初始化所有变量，必须都写
//析构器 deinit 用于释放资源,只用于类class
class Size2 {
    var x = 0 , y = 0;
    deinit {
        print("deinit");
    }
}
var s3:Size2? = Size2();  //可选变量才能设置为nil
s3 = nil;


//类和结构体的下标, 下标的参数可以是任意类型，任意个数。不能有默认值
struct TimeTable {
    var timer: Int;
    subscript(index: Int) -> Int {
        get{
            return timer * index;
        }
        set{
            timer = newValue;
        }
    }
}
var t = TimeTable(timer: 2);
print(t[1])
print(t[3])



