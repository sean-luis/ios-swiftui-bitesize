public extension String {
    var localized: String {
        SwiftUIBitesizeLocalizer.shared.localizedString(forKey: self)
    }
}
