//泛型
//多个泛型参数之间用逗号分隔
func swapVal<T> (inout a:T, inout b:T) {
    let temp = a;
    a = b;
    b = temp;
}

struct Stack<T> {
    var items = [T]();
    mutating func push (item: T) {
        items.append(item);
    }
    mutating func pop() -> T {
        return items.removeLast();
    }
}
var stackStr = Stack<String>();

//扩展泛型类型，不需要提供泛型参数列表
extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1];
    }
}

//泛型类型约束：指定特定的类型必须继承自某些类或遵从某些协议
//语法格式： func someFunc<T: SomeClass, U: SomeProtocol>(someT: T, someU: U){}
func findIndex<T: Equatable>(array: [T], valueToFind: T) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index;
        }
    }
    return nil;
}

//还可以通过where语句定义类型的约束
func allItemMatch<C1: Container, C2:Container where C1.ItemType == C2.ItemType , C1.ItemType : Equatable> (container1: C1, container2: C2) -> Bool {
    if container1.count != container2.count {
        return false;
    }
    for i in 0..<container1.count {
        if container1[i] != container2[i] {
            return false;
        }
    }
    return true;
}

//关联类型：协议中某类型的占位符。typealias声明。
protocol Container {
    typealias ItemType;
    mutating func append(item: ItemType);
    var count: Int {get};
    subscript(i: Int) -> ItemType {get}
}
struct Stack2<T>: Container {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item);
    }
    mutating func pop() -> T {
        return items.removeLast();
    }
    
//    typealias ItemType = T;
    mutating func append(item: T) {
        self.push(item);
    }
    var count: Int{
        return items.count;
    }
    subscript (i:Int) -> T {
        return items[i];
    }
}










