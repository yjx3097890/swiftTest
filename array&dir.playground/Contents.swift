//: Playground - noun: a place where people can play

import UIKit

var arr1:Array<Int> = [1,2,3,4,5,6];
let arr2:[Float] = [1, 2.33,1];
var arr3 = [1,2,3,"sss"] ;
var arr4 = [String]();
var arr5 = [];
var arr51 = Array<Int>();
arr3[3]=4;

var arr6 = [Int](count: 4, repeatedValue: 6);
print(arr6)

var arr7 = arr1 + arr6;

var arr8 = ["ios", "win10", "linux"];
 arr8[0...1] = ["ios3", "win13", "linux3"];
print(arr8)

arr8 += ["wp10"];
print(arr8)

arr8.insert("ss", atIndex: 4)
arr8.removeAtIndex(4)
arr8.isEmpty;

//for里面不需要声明
for 提 in arr8 {
    print(提)
}
for i in 0..<arr8.count {
    print("\(i)==>\(arr8[i])")
}
arr8.enumerate();

//字典
var dir1:Dictionary<String,String> = ["yjx": "阎继先", "qq": "图形"];
var dir2:[String:String] = ["yjx": "阎继先", "qq": "图形"];
var dir3 = ["yjx": "阎继先", "qq":2];

var dir4 = Dictionary<String, Int>();
var dir5 = [String: Int]();
var dir6:NSMutableDictionary = [:];  //默认为NSDirectionary，不能修改
dir6[33] = "baga";

var val = dir6[33];
print(val)
dir2["22"] = "22";
var val2:Int? = Int(dir2["22"]!);

for (k, v) in dir6 {
    print(k,v)
}
print(dir6.allKeys)
print((dir6 as Dictionary).keys) //强制转换
var arr11 = Array<Int>(dir5.values)
var arr12 = Array(dir5.values)
var arr13 = [Int](dir5.values)

