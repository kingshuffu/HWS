import Cocoa

struct Album {
    let title: String
    let artist: String
    let year: Int
    
    func printSummary(){
        print("\(title) (\(year)) by \(artist) ")
    }
}

let red = Album(title: "Wunna", artist: Gunna, year: 2021)
