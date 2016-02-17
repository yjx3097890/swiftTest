//: Playground - noun: a place where people can play

func myf0(_: String = "mike", _: Int = 8) -> String {
    return "0";
}

func myf1(name p1: String = "mike", age:Int = 8) -> String {
    return "name \(p1) - \(age)";
}
myf1(age: 11, name: "ss")  //label必须写

//函数调用时，如果参数保持顺序，则第一个参数的label可以省略，后面的必须写。

func myf21(p1:String = "mike", xx:Int) -> String {
    return "name \(p1) - \(xx)";
}
myf21("aa", xx:12) //xx必须写

func myf2(p1 p1:String = "mike", xx:Int) -> String {
    return "name \(p1) - \(xx)";
}
myf2(p1:"aa", xx:12) //xx必须写

func myf3(p1:String = "mike", _ xx:Int) -> String {
    return "name \(p1) - \(xx)";
}
myf3("aa", 12)

func myf4(p1:String = "mike", arrs:Int ...) -> String {
    for a in arrs {   //a 默认为let
        print(a);
    }
    
    return "name \(p1) - \(arrs)";
}
myf4(arrs: 1,2,3,4,5,5);
func myf5( var p1:String = "mike", arrs:Int ...) -> String {
    for a in arrs {   //a 默认为let
        p1 +=  String(a);
    }
    
    return "name \(p1) - \(arrs)";
}

func myf6(inout name: String, age: Int) -> String{
    name = "mike";
    return name;
}
var name = "yjx";
myf6(&name, age: 11);
print(name);

var myf7: (inout name:String, age: Int) -> String;
myf7 = myf6;

func myf8 (f: (String, Int) -> String, str: String) -> (Int)->Int {
    func myf9(_:Int) -> Int {
        return 0;
    };
    return myf9;
}
