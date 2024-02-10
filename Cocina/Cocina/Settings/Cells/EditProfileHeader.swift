//
//  EditProfileHeader.swift
//  Cocina
//
//  Created by Andrea Jimenez on 2/2/24.
//

import UIKit
import SwiftUI
import SnapKit

protocol EditProfileHeaderDelegate {
    func didTapEditImageButton()
}

class EditProfileHeader: UIView {
    
    var delegate: EditProfileHeaderDelegate?
    let size: CGFloat = 95
    lazy var spacer: CGFloat = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0
    
    lazy var profilePicture: UIImageView = {
        let picture = UIImageView()
        picture.image = UIImage(named: "AppIcon")
        picture.layer.cornerRadius = size / 2
        picture.translatesAutoresizingMaskIntoConstraints = false
        picture.clipsToBounds = true
        picture.contentMode = .scaleAspectFill
        return picture
    }()
    
    lazy var editButton: UIButton = {
        let button = UIButton(type: .custom)
        let sfSymbol = UIImage(systemName: "pencil.circle.fill")
        button.tintColor = .background.ramenPrimary
        button.setImage(sfSymbol, for: .normal)
        button.addTarget(self, action: #selector(editImageButtonTapped), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        backgroundColor = .systemGray6
        observeChangesToImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func editImageButtonTapped(sender : UIButton) {
        delegate?.didTapEditImageButton()
    }

    
    private func configureUI() {
        addSubview(profilePicture)
        insertSubview(editButton, aboveSubview: profilePicture)
        
        profilePicture.snp.makeConstraints { make in
            make.width.height.equalTo(size)
            make.top.equalTo(self).offset(100)
            make.centerX.equalTo(self.snp.centerX)
            make.bottom.equalTo(self)
        }
        editButton.snp.makeConstraints { make in
            make.trailing.equalTo(profilePicture.snp.trailing)
            make.bottom.equalTo(profilePicture.snp.bottom)
        }
    }
    
    private func observeChangesToImage() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateImage(from:)), name: .init("Changed image"), object: nil)
    }
    
    @objc
    func updateImage(from: NSNotification) {
        if let info = from.userInfo,
           let image = info["image"] as? UIImage {
            profilePicture.image = image
        }
    }
}

struct EditProfileHeaderRepresdentable: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        EditProfileHeader()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}

struct EditProfileHeader_Preview: PreviewProvider {
    static var previews: some View {
        EditProfileHeaderRepresdentable()
            .frame(width: 300, height: 100)
            .previewLayout(.sizeThatFits)
    }
}
