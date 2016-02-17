//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var num = 3.3;

print(str + String(num));

print(" \(str) \(num)")

var  `var`:String = "var";

var a:Int32 = 33;
var b:Int8 = 22;
a=Int32(b);

Int.max;
//2进制，8进制，16进制0x
let binaryInt = 0b1100;
let octalInt = 0o1100;

var f1:Float = 33_99.3;
var f2:Float64 = 444.444444;
var f3:Double = 444.444444;
//强制类型转换
a = Int32(f1);

//变量别名
typealias Byte = Int8;
var by:Byte = 22;

//bool
var bo:Bool = true;
if bo {
    print(bo);
}

//字符，字符串都用双引号
var c:Character = "s";
c = "王";

var s:String = String();
var st:String = "";

let str1:String = "Hwertyuioplkjhgfdsa";
for s in str1.unicodeScalars {
    print(s.value);
}

print(str.uppercaseString);
print(str1.lowercaseString);

var arr = (24, "ttt",boo: true);
print(arr.boo);
var (aa,_, bb) = arr;

var num1:String = "123";
var value:Int? = Int(num1);  //必须声明为可选类型，Int转Int32则不需要，String（）也不需要
print(value)
var value2:Int! = Int(num1);  //确定不为nil用！
print(value2+2)


