//
//  ProfileMainHeader.swift
//  Cocina
//
//  Created by Andrea Jimenez on 1/22/24.
//

import UIKit
import SwiftUI

class ProfileMainHeader: UIView {

    let size: CGFloat = 75
    let space = UIView(frame: .init(x: 0, y: 0, width: 0, height: 0))
    
    lazy var profilePicture: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "AppIcon"))
        imageView.layer.cornerRadius = size / 2
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .ramenFont(for: .headingL)
        label.textColor = .text.primary
        label.text = "Blaine Beltran"
        return label
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .ramenFont(for: .bodyM)
        label.textColor = .text.secondary
        label.text = "thisismyusername"
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profilePicture, nameLabel, usernameLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 3
        stackView.isLayoutMarginsRelativeArrangement = true
        let spacer = self.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: spacer, leading: 0, bottom: 0, trailing: 0)
        stackView.backgroundColor = .systemGray6
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func configureUI() {
        addSubview(stackView)
        profilePicture.snp.makeConstraints { make in
            make.height.width.equalTo(size)
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.trailing.bottom.equalTo(self)
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
