import Foundation
import SwiftUI
import UIKit
import Combine

final class SportsTableViewController: UITableViewController {
    private let viewModel: SportsViewModel
    private let kDefaultCellIdentifier = String(describing: UITableViewCell.self)
    private let kButtonCellIdentifier = String(describing: ButtonTableViewCell.self)
    
    // MARK: - ViewController lifecycle
    
    init(viewModel: SportsViewModel) {
        self.viewModel = viewModel
        super.init(style: .insetGrouped)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        tableView.backgroundColor = .systemGroupedBackground
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: kDefaultCellIdentifier)
        tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: kButtonCellIdentifier)
    }
}

// MARK: - Tableview delegate & datasource methods
extension SportsTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let section = SportSections(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .listView: return makeSportItemTableViewCell(at: indexPath)
        case .animationTrigger: return makeButtonTableViewCell(at: indexPath)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let section = SportSections(rawValue: indexPath.section), section == .listView else { return }
        viewModel.selectedSport = viewModel.sportsData[indexPath.row]
    }
}

// MARK: - Cell factory methods
extension SportsTableViewController {
    private func makeSportItemTableViewCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kDefaultCellIdentifier, for: indexPath)
        cell.textLabel?.text = viewModel.sportsData[indexPath.row].title
        cell.imageView?.image = viewModel.sportsData[indexPath.row].image
        return cell
    }
    
    private func makeButtonTableViewCell(at indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kButtonCellIdentifier, for: indexPath) as? ButtonTableViewCell
        cell?.hostButtonView(title: shuffleButtonTitle, action: { [weak self] in
            self?.shuffleSports()
        })
        return cell ?? UITableViewCell()
    }
    
    private func shuffleSports() {
        viewModel.shuffleSports()
        viewModel.selectedSport = nil
        tableView.reloadSections([SportSections.listView.rawValue], with: .automatic)
    }
}

// MARK: - Strings
extension SportsTableViewController {
    var shuffleButtonTitle: String { "SPORTS_VIEW_SHUFFLE_BUTTON_TITLE".localized }
}
