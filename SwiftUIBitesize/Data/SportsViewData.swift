import UIKit

let sportsViewData: [Sport] = {
    func sportsImage(named name: String) -> UIImage {
        UIImage(named: "figure.\(name.lowercased())") ?? UIImage()
    }
    
    return [Sport(title: "Running",
                  image: sportsImage(named: "Run")),
            Sport(title: "Dancing",
                  image: sportsImage(named: "Dance")),
            Sport(title: "Fencing",
                  image: sportsImage(named: "Fencing")),
            Sport(title: "Fishing",
                  image: sportsImage(named: "Fishing")),
            Sport(title: "Golf",
                  image: sportsImage(named: "Golf")),
            Sport(title: "Hockey",
                  image: sportsImage(named: "Hockey")),
            Sport(title: "Hiking",
                  image: sportsImage(named: "Hiking")),
            Sport(title: "Soccer",
                  image: sportsImage(named: "Soccer")),
            Sport(title: "Surfing",
                  image: sportsImage(named: "Surfing")),
            Sport(title: "Rugby",
                  image: sportsImage(named: "Rugby")),
            Sport(title: "Tennis",
                  image: sportsImage(named: "Tennis"))]
}()
