import UIKit
import SwiftUI

class ButtonTableViewCell: UITableViewCell {
    func hostButtonView(title: String, action: @escaping (() -> Void)) {
        applyCommonConfiguration()
        
        if #available(iOS 16.0, *) {
            configureCellUsingUIHostingConfiguration(title: title, action: action)
        } else {
            configureCellUsingUIHostingController(title: title, action: action)
        }
    }
    
    @available(iOS 16.0, *)
    private func configureCellUsingUIHostingConfiguration(title: String, action: @escaping (() -> Void)) {
        contentConfiguration = UIHostingConfiguration {
            HStack(alignment: .center) {
                Spacer()
                ButtonView(title: title, action: action)
                Spacer()
            }
        }
    }
    
    private func configureCellUsingUIHostingController(title: String, action: @escaping (() -> Void)) {
        let hostingView = UIHostingController(rootView: ButtonView(title: title, action: action))
        hostingView.view.backgroundColor = .clear
        contentView.addSubview(hostingView.view)
        
        // MARK: - Setup constraints
        hostingView.view.translatesAutoresizingMaskIntoConstraints = false
        hostingView.view.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        hostingView.view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        hostingView.view.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        hostingView.view.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
    }
    
    private func applyCommonConfiguration() {
        selectionStyle = .none
        backgroundColor = .clear
    }
}
