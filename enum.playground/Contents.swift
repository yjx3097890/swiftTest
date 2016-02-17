// 枚举
//枚举也是一种结构体
enum e1{
    case v1
    case v2
}

enum e2 {
    case v1, v2
}

var a = e1.v1;

if a == .v1 {
    print(a);
}

switch a {
case .v1:
    print("v1");
case .v2:
    print("v2");
}

enum product {
    case Auto(String, Int, Float, Float)
    case Mobile(String, Float, String, Float)
}
//对于已知类型可以使用简写
let p1:product = .Auto("car", 8, 25, 12);
let p2 = product.Mobile("nokia", 5.5, "ios", 9000);

switch p2 {
case .Auto(let name, let wheel, let payload, let price):
    print(name,wheel, payload, price);
case .Mobile(let name, let size, let os, let price):
    print(name, size, os, price);
}
//为枚举设置原始值，通过rawValue属性访问
enum e3:String {
    case name = "bill"
    case location = "太原"
    case job
}

e3.name.rawValue
e3.job.rawValue
//使用init?(rawValue: value)创建枚举的实例
let ss:e3! = e3.init(rawValue: "bill")  //从原始值获取相应的枚举成员
print(ss);
let uu = e3(rawValue: "太原");

//枚举中也可以定义方法
enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
//会根据第一个数，依次设置别的rawValue
let twoRawValue = Rank.Two.rawValue








