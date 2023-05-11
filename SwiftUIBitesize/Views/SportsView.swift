import SwiftUI

struct SportsView: UIViewControllerRepresentable {
    var viewModel: SportsViewModel

    func makeUIViewController(context: Context) -> SportsTableViewController {
        SportsTableViewController(viewModel: viewModel)
    }
    
    func updateUIViewController(_ uiViewController: SportsTableViewController, context: Context) {
        // Perform any updates to the viewController as needed
    }
}
