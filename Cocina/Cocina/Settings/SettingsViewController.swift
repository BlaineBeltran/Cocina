//
//  SettingsViewController.swift
//  Cocina
//
//  Created by Andrea Jimenez on 2/10/24.
//

import UIKit
import SnapKit
import SwiftUI

enum SettingsSections: Int, CaseIterable {
    case sectionOne
    case sectionTwo
    case sectionThree
    
    var rowName: [String] {
        switch self {
        case .sectionOne:
            return ["Dark Mode", "Calendar Start Date"]
        case .sectionTwo:
            return ["Sync"]
        case .sectionThree:
            return ["Connect Other Apps"]
        }
    }
    
    var rowIcon: [UIImage] {
        switch self {
        case .sectionOne:
            return [UIImage(systemName: "moon")!, UIImage(systemName: "calendar")!]
        case .sectionTwo:
            return [UIImage(systemName: "cloud")!]
        case .sectionThree:
            return [UIImage(systemName: "link")!]
        }
    }
}

struct settingsTableViewData {
    let section: SettingsSections?
    
    var rows: Int {
        switch section {
        case .sectionOne: return 2
        case .sectionTwo: return 1
        case .sectionThree: return 1
        case .none:
            return 0
        }
    }
}

class SettingsViewController: UIViewController {
    
    var coordinator: HomeCoordinator?
    
    let tableView: UITableView = {
        let tableview = UITableView(frame: CGRect.zero, style: .insetGrouped)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.isScrollEnabled = false
        return tableview
    }()
    
    lazy var calendarMenuButton: UIButton = {
        let calendarMenuButton = UIButton(primaryAction: nil)
        calendarMenuButton.tintColor = .background.ramenPrimary
        calendarMenuButton.titleLabel?.textAlignment = .right
        calendarMenuButton.menu = UIMenu(children: [
            UIAction(title: "Sunday", handler: {_ in
                print(self.calendarMenuButton.frame)
            }),
            UIAction(title: "Monday", handler: {_ in
                // Handler is being called on main thread so we don't
                // need to dispatch work to main queue
                self.calendarMenuButton.sizeToFit()
            })
        ])
        calendarMenuButton.showsMenuAsPrimaryAction = true
        calendarMenuButton.changesSelectionAsPrimaryAction = true
        calendarMenuButton.sizeToFit()
        return calendarMenuButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        title = "Settings"
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.top.trailing.bottom.equalTo(view)
        }
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        SettingsSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = SettingsSections(rawValue: section) else { return 0 }
        let sectionViewModel = settingsTableViewData(section: section)
        return sectionViewModel.rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Content configuration
        var content = cell.defaultContentConfiguration()
        content.text = SettingsSections(rawValue: indexPath.section)?.rowName[indexPath.row]
        content.image = SettingsSections(rawValue: indexPath.section)?.rowIcon[indexPath.row]
        content.imageProperties.tintColor = .background.ramenPrimary
        cell.contentConfiguration = content
        
        // Accessory
        switch (indexPath.section, indexPath.row) {
        case(0,0):
            // If you are going to have buttons on cell, create the illusion that tapping on a cell does nothing.
            cell.selectionStyle = .none
            let swiftUIToggleButton = ToggleButton()
            let host = UIHostingController(rootView: swiftUIToggleButton)
            host.view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
            // hides the square frame when clicking on cell
            host.view.backgroundColor = .clear
            cell.accessoryView = host.view
        case(0,1):
            // If you are going to have buttons on cell, create the illusion that tapping on a cell does nothing.
            cell.selectionStyle = .none
            cell.accessoryView = calendarMenuButton
        default:
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch (indexPath.section, indexPath.row) {
        case (1,0):
            coordinator?.showSync()
        default:
            break
        }
    }
    
}
