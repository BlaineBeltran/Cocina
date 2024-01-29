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
    
    lazy var stackView: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [profilePicture, nameLabel, emailLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 3
        return stackView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureUI() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
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
            .frame(width: 300, height: 200)
            .previewLayout(.sizeThatFits)
    }
}
