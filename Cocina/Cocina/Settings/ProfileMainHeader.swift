//
//  ProfileMainHeader.swift
//  Cocina
//
//  Created by Andrea Jimenez on 1/22/24.
//

import UIKit
import SwiftUI

class ProfileMainHeader: UITableViewHeaderFooterView {

    let profilePicture: UIImageView = {
        let profilePicture = UIImageView(image: UIImage(named: "ProfilePicture1"))
        profilePicture.translatesAutoresizingMaskIntoConstraints = false
        return profilePicture
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .ramenFont(for: .headingL)
        label.textColor = .text.primary
        label.text = "Blaine Beltran"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .text.secondary
        label.text = "blaine.extra@gmail.com"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureUI() {
        addSubview(profilePicture)
        addSubview(nameLabel)
        addSubview(emailLabel)
        
        NSLayoutConstraint.activate([
            profilePicture.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            profilePicture.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
            nameLabel.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: profilePicture.trailingAnchor, constant: 10)
        ])
    }

}

struct ProfileMainHeaderRepresdentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        ProfileMainHeader()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
}

struct ProfileMainHeader_Preview: PreviewProvider {
    static var previews: some View {
        ProfileMainHeaderRepresdentable()
            .frame(width: 300, height: 100)
            .previewLayout(.sizeThatFits)
    }
}
