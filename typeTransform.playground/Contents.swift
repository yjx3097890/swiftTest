//类型转换

//is 判断类型
//as 转换类型 。as?表示转换失败也不会抛出异常，返回一个可选类型.as!表示强制转换，即as?转换后,再将可选类型展开。

class Media {
    var name: String;
    init (name: String) {
        self.name = name;
    }
}

class Movie: Media{
    var director: String;
    init (name: String, director: String) {
        self.director = director;
        super.init( name: name );
    }
}

class Song: Media {
    var artist: String;
    init (name: String, artist: String) {
        self.artist = artist;
        super.init(name: name);
    }
}

let liberary = [
    Movie(name: "ss", director: "aa"),
    Song(name: "qq", artist: "qq")
]

liberary[0] is Movie
liberary[0] is Song
liberary[0] is Media

let ccc = liberary[0] as? Movie

//AnyObject可以表示任何class类型的示例
//Any可以表示出函数以外的任何类型
let movies:[AnyObject] = [
    Movie(name: "ww", director: "qq"),
    Movie(name: "ee", director: "ee")
]
for mo in movies as! [Movie] {
    print(mo);
}

var arrs:[Any] = [];
arrs.append(0);
arrs.append(0.0);
arrs.append("ss");
arrs.append({() in "aa"})



