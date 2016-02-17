//: Playground - noun: a place where people can play

var names:[String] = ["mike", "yjx", "cyr", "wzw"];

func sortF(s1:String, s2:String) -> Bool {
    return s1<s2;
}

var sortedNames = names.sort( sortF);

//改造1

var names0 = names.sort( { (s1:String,s2:String) -> Bool in return s1 > s2
});
//改造2
var names1 = names.sort( { (s1,s2) -> Bool in return s1 > s2 });
//改造3
var names2 = names.sort( { (s1,s2) -> Bool in s1 > s2 });
//改造4
var names3 = names.sort( { (s1,s2) in s1 > s2 });
//改造5
var names4 = names.sort( { $0>$1 });
print(names1)
//改造6
var names5 = names.sort(<);
//改造7
var names6 = names.sort() {$0 < $1};
//改造8
var names7 = names.sort{$0 < $1};



