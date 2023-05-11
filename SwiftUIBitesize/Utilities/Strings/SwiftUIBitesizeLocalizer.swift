import Foundation

public class SwiftUIBitesizeLocalizer {
    static let shared = SwiftUIBitesizeLocalizer()
    
    private let bundle = Bundle(for: SwiftUIBitesizeLocalizer.self)
    private let table = "SwiftUIBitesize"
    
    func localizedString(forKey key: String) -> String {
        let string = bundle.localizedString(forKey: key, value: nil, table: table)
        
        if string.isEmpty || string == key {
            NSLog("You have not localised the following string value for key: \(key). Please add it to the string table: \(table)")
            return string
        }
        return string
    }
}
