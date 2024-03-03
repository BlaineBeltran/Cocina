//
//  SyncViewController.swift
//  Cocina
//
//  Created by Andrea Jimenez on 2/17/24.
//

import UIKit
import SnapKit
import SwiftUI

class SyncViewController: UIViewController {
    
    let tableview: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.delegate = self
        tableview.dataSource = self
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}

extension SyncViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.selectionStyle = .none
        // accessory
        let swiftUIToggleButton = ToggleButton()
        let host = UIHostingController(rootView: swiftUIToggleButton)
        host.view.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        // hides the square frame when clicking on cell
        host.view.backgroundColor = .clear
        cell.accessoryView = host.view
        //content
        var content = cell.defaultContentConfiguration()
        content.text = "iCloud Sync"
        content.image = UIImage(systemName: "icloud")
        content.imageProperties.tintColor = .background.ramenPrimary
        content.secondaryAttributedText = NSAttributedString(string: "When turned on, information is safely stored in iCloud and automatically kept in sync across all your devices.", attributes: [.font: UIFont.ramenFont(for: .bodyS)])
        content.secondaryTextProperties.lineBreakMode = .byWordWrapping
        content.directionalLayoutMargins.trailing = 40
        content.textToSecondaryTextVerticalPadding = 10
        cell.contentConfiguration = content
        return cell
    }
}
