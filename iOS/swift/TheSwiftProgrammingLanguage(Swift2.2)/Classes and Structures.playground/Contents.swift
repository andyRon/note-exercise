
class SomeClass {
    
}

struct SomeStruct {
    
}

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()   // 分辨率
    var interlaced = false          // 非隔行扫描 视频
    var frameRated = 0.0            // 回放帧率
    var name: String?               //
}

let someResolution = Resolution()
let someVideoMode = VideoMode()

let vga = Resolution(width: 640, height: 480)

let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2000
hd.width

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.frameRated = 25.0
tenEighty.name = "1080i"
let alsoTenEighty = tenEighty
alsoTenEighty.frameRated = 30.0

tenEighty.frameRated

if tenEighty === alsoTenEighty {
    print("ad")
}