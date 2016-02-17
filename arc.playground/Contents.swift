//: Playground - noun: a place where people can play

class Persion {
    let name: String;
    var apart:Apartment?;
    init (name: String) {
        self.name = name;
        print("init");
    }
    deinit {
        print("deinit");
    }
}

//弱引用 weak
class Apartment {
    let number: Int;
    weak var tenant: Persion?;
    init(number:Int) {
        self.number = number;
    }
    deinit {
        print("apartment deinit");
    }
}

var p1: Persion? = Persion(name: "ss");
var p2 = p1;
p1 = nil;
p2 = nil;



var jone:Persion? = Persion(name: "jone");
var apart1: Apartment? = Apartment(number: 1);
jone!.apart = apart1;
apart1!.tenant = jone;
apart1 = nil;
jone = nil;

//无主引用
//无主引用总是被定义为非可选类型，使用unowned
class Customer {
    let name: String;
    var card: CreditCard?;
    init(name:String) {
        self.name = name;
    }
    deinit{
        print("customer deinit")
    }
}
class CreditCard {
    let number: Int;
    unowned let customer: Customer;
    init (number:Int, cus:Customer) {
        self.number = number;
        self.customer = cus;
    }
    deinit {
        print("credit deinit")
    }
}

var merry: Customer?;
merry = Customer(name: "marry");
var cc = CreditCard(number: 2, cus: merry!);
merry!.card = cc;
merry = nil;

print("cc", cc.customer.name);


//闭包捕获列表
class HtmlElement {
    let name: String;
    let text: String?;
    lazy var asHtml: () -> String =  {
        [unowned self] () -> String in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>";
        }
    
    }
    
    init (name:String="div", text:String?=nil) {
        self.name = name;
        self.text = text;
    }
    deinit {
        print("html deinit")
    }
}







