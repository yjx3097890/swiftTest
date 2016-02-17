//: 类的继承
// 子类只能继承一个父类
class Vehical {
    var wheel: Int;
    var pas: Int{
        get{
            return wheel + 1;
        }
        set{
            
        }
    };
    var speed: Double {
        didSet {
        
        }
        willSet {
            
        }
    }
    func desc () {
        print(wheel, pas);
    }
    init () {
        wheel = 4;
        speed = 3.5;
        
        pas = 3;
    }
    required init (pas:Int) {
        wheel = 4;
        speed = 3.5;
        
        self.pas = pas;
    }
}

class Bicycle: Vehical {
    
    override var wheel: Int {
        set {
            
        }
        get {
            return 11;
        }
    }
    override var pas : Int {
        willSet {
            print("will")
        }
    }
    override init () {
        super.init();  //必须先调用父类init
        wheel = 2;
    }

    required init(pas: Int) {
        fatalError("init(pas:) has not been implemented")
    }

}

//重写方法和属性要用override修饰，方法中父类用super，自己用self
//required关键字强制子类对该方法进行重写
//只能将存储属性覆盖为计算属性，或计算属性覆盖get，set。不能将计算属性覆盖为存储属性
//override也可以重写willSet和didSet，但不能为常量存储属性和只读计算属性添加观察器, 也不能同时重写setter和观察器
//可以在属性和方法前用final阻止重写。

//方便构造器: 为init提供默认值,因为方便构造器中可以调用(必须调用一次)别的构造器（普通构造器不能调用init）
class Food {
    var name: String;
    init(name:String) {
        self.name = name;
    }
    convenience init () {
        self.init(name: "sss"); //必须且只调用一次
    }
    convenience init (name1:String) {
        self.init(); //必须且只调用一次
    }
}

//若子类没有构造器则，会继承父类的所有构造器。
//若子类有构造器，这不会继承父类的任何构造器。
//之类构造器中必须调用父类的构造器一次，
//一般来说，子类的初始化顺序是：
//1.初始化子类自己的属性，
//2.调用父类的相应的初始化方法，super.init()
//3.对父类中的需要改变的成员进行设定，
//注：如果不需要第三步，则super.init()也可以省略，编译器自动调用

//可失败构造器init?：当构造实例失败时，返回nil。
class Circle {
    var radius: Double
    
    init?(radius: Double) {
        self.radius = radius
        if radius <= 0 {
            return nil
        }
    }
    
   func simpleDescription() -> String {
        return "A circle with a radius of \(radius)."
}
}