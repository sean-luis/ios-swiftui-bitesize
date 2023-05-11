import Foundation
import SwiftUI

class SportsViewModel: ObservableObject {
    @Published var selectedSport: Sport?
    private(set) var sportsData = sportsViewData
    
    func shuffleSports() {
        var mutableSportsData = sportsData
        mutableSportsData.shuffle()
        sportsData = mutableSportsData
    }
}

// MARK: - Tableview requirements
extension SportsViewModel {
    var numberOfSections: Int {
        SportSections.allCases.count
    }
    
    func numberOfRows(in section: Int) -> Int {
        guard let section = SportSections(rawValue: section) else { return 0 }
        return section == .listView ? sportsData.count : 1
    }
}
