//
//  SettingsViewController.swift
//  Cocina
//
//  Created by Blaine Beltran on 1/19/24.
//

import UIKit

enum ProfileSections: Int, CaseIterable {
    case sectionOne
    case sectionTwo
    case sectionThree
    
    var rowName: [String] {
        switch self {
        case .sectionOne:
            return ["Edit Profile", "Change Password"]
        case .sectionTwo:
            return ["Settings"]
        case .sectionThree:
            return ["Privacy Policy", "Help"]
        }
    }
    
    var rowIcon: [UIImage] {
        switch self {
        case .sectionOne:
            return [UIImage(systemName: "person")!, UIImage(systemName: "lock")!]
        case .sectionTwo:
            return [UIImage(systemName: "gearshape")!]
        case .sectionThree:
            return [UIImage(systemName: "lock")!, UIImage(systemName: "questionmark.circle")!]
        }
    }
}

struct tableViewData {
    let section: ProfileSections?
    
    var rows: Int {
        switch section {
        case .sectionOne:
            return 2
        case .sectionTwo: return 1
        case .sectionThree: return 2
        case .none:
            return 0
        }
    }
}

class SettingsViewController: UIViewController {
    
    let profileHeader = ProfileMainHeader()
    
    let tableView: UITableView = {
        let tableview = UITableView(frame: CGRect.zero, style: .insetGrouped)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.isScrollEnabled = false
        return tableview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(profileHeader)
        view.addSubview(tableView)
        profileHeader.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(profileHeader.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}

extension SettingsViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        ProfileSections.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = ProfileSections(rawValue: section) else { return 0 }
        let sectionViewModel = tableViewData(section: section)
        return sectionViewModel.rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.accessoryType = .disclosureIndicator
        cell.accessoryView?.backgroundColor = .systemPink
        var content = cell.defaultContentConfiguration()
        let rowName = ProfileSections(rawValue: indexPath.section)?.rowName[indexPath.row]
        content.text = rowName
        let rowIcon = ProfileSections(rawValue: indexPath.section)?.rowIcon[indexPath.row]
        content.image = rowIcon
        content.imageProperties.tintColor = .background.ramenPrimary
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath {
        case [0,0]:
            let editProfileVC = EditProfileViewController()
            self.navigationController?.pushViewController(editProfileVC, animated: true)
        case [0,1]:
            let editPasswordVC = EditPasswordViewController()
            self.navigationController?.pushViewController(editPasswordVC, animated: true)
        default:
            break
        }
    }
}
