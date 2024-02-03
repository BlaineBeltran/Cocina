//
//  EditProfileViewController.swift
//  Cocina
//
//  Created by Andrea Jimenez on 1/26/24.
//

import UIKit
import SnapKit

enum EditProfile: Int, CaseIterable {
    case rowOne
    case rowTwo
    case rowThree
    
    var rowName: String {
        switch self {
        case .rowOne:
            return "Name"
        case .rowTwo:
            return "Username"
        case .rowThree:
            return "Email"
        }
    }
    
    var userData: String {
        switch self {
        case .rowOne:
            return "Blaine Beltran"
        case .rowTwo:
            return "thisismyusername"
        case .rowThree:
            return "testing123@gmail.com"
        }
    }
    
    var placeholder: String {
        switch self {
        case .rowOne:
            return "Enter your name"
        case .rowTwo:
            return "Enter your username"
        case .rowThree:
            return "Enter your email address"
        }
    }
}

class EditProfileViewController: UIViewController {
    
    let profilePictureHeader = EditProfileHeader()
    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        tableView.register(EditProfileTableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(profilePictureHeader)
        view.addSubview(tableView)
        profilePictureHeader.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view)
            make.height.equalTo(180)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(profilePictureHeader.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
}

extension EditProfileViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        EditProfile.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EditProfileTableViewCell
        cell.cellTitle.text = EditProfile(rawValue: indexPath.row)?.rowName
        cell.textField.text = EditProfile(rawValue: indexPath.row)?.userData
        cell.textField.placeholder = EditProfile(rawValue: indexPath.row)?.placeholder
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
