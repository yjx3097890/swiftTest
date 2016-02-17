//扩展
//扩展计算属性
extension Double {
    var km: Double{
        return self * 1_000.0;
    }
    var m: Double {
        return self;
    }
}
let o = 25.4.m;
print(o.km);

//扩展构造器
struct Size{
    var width = 0.0;
    var height = 0.0;
}
struct Point {
    var x = 0.0;
    var y = 0.0;
}
struct Rect {
    var origin = Point();
    var size:Size;
}
var rect = Rect(origin: Point(), size: Size());
extension Rect {
    init (center: Point, size: Size) {
        self.init(origin: Point(x: center.x - size.width / 2, y: center.y - size.height / 2), size: size);
    }
}

//扩展方法
//扩展实例方法
extension Int {
    //结构体和枚举类型(类不需要)中修改self或其属性的实例方法必须用mutating修饰。
    mutating func square () {
        self *= self;
    }
}
var int = 3;
int.square();
print(int);

//扩展下标
extension Int {
    subscript (index: Int) -> Int {
        var decimal = 1;
        for _ in 1...index {
            decimal *= 10
        }
        return (self / decimal) % 10;
    }
}
1234[1]






