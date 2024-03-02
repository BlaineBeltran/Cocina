//
//  EditProfileViewController.swift
//  Cocina
//
//  Created by Andrea Jimenez on 1/26/24.
//

import UIKit
import SnapKit
import PhotosUI
import SwiftUI

enum EditProfile: Int, CaseIterable {
    case rowOne
    case rowTwo
    case rowThree
    case rowFour
    
    var rowName: String {
        switch self {
        case .rowOne:
            return "Name"
        case .rowTwo:
            return "Username"
        case .rowThree:
            return "Email"
        case .rowFour:
            return "Password"
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
        case .rowFour:
            return "password"
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
        case .rowFour:
            return "Enter a new password"
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
    
    lazy var containerView: UIView = {
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        return containerView
    }()
    
    lazy var deleteAccountButton: UIView = {
        let deleteAccountButton = RamenButton(type: .secondaryAction, text: "Delete Account") {
            print("tapped")
            // uialert controller sheet style
        }
        let host = UIHostingController(rootView: deleteAccountButton)
        host.view.backgroundColor = .clear
        let buttonAsUIView = host.view!
        return buttonAsUIView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        profilePictureHeader.delegate = self
        configureUI()
        tableView.tableFooterView = containerView
        
        view.backgroundColor = .blue
    }
    
    private func configureUI() {
        view.addSubview(profilePictureHeader)
        view.addSubview(tableView)
        containerView.addSubview(deleteAccountButton)
        
        profilePictureHeader.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(profilePictureHeader.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
        deleteAccountButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(45)
            make.centerY.equalToSuperview()
        }
    }
}

// MARK: TableView

extension EditProfileViewController: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        EditProfile.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EditProfileTableViewCell
        cell.cellTitle.text = EditProfile(rawValue: indexPath.row)?.rowName
        cell.textField.text = EditProfile(rawValue: indexPath.row)?.userData
        cell.textField.placeholder = EditProfile(rawValue: indexPath.row)?.placeholder
        cell.textField.delegate = self
        cell.textField.tag = indexPath.row
        if cell.textField.tag == 3 {
            cell.textField.isSecureTextEntry = true
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // update the user object
        textField.resignFirstResponder()
        print(textField.tag)
        return true
    }
}

// MARK: EditProfileHeaderDealagte & PickerVC 
extension EditProfileViewController: EditProfileHeaderDelegate, PHPickerViewControllerDelegate {
    func didChangeProfileHeaderImage(to: UIImage) {
        
    }
    
    func didTapEditImageButton() {
        print("Show image picker")
        showImagePickerOptions()
    }
    
    // returns an image picker with source type
    func imagePicker(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .camera
        return imagePicker
    }
    
    func showImagePickerOptions() {
        // alert view controller
        let alertVC = UIAlertController(title: "Chose your profile picture", message: "Choose a photo or customize with icon", preferredStyle: .actionSheet)
        
        // image picker for camera
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { [weak self] (action) in
            guard let self = self else { return }
            let cameraImagePicker = self.imagePicker(sourceType: .camera)
            self.present(cameraImagePicker, animated: true)
            
        }
        
        //image picker for library using PHPicker instead of uiimage library
        let libraryAction = UIAlertAction(title: "Photo Library", style: .default) { [weak self] (action) in
            guard let self = self else { return }
            
            // configurations for picker
            var config = PHPickerConfiguration()
            config.filter = .images
            config.selectionLimit = 1
            config.selection = .default
            let picker = PHPickerViewController(configuration: config)
            picker.delegate = self
            self.present(picker, animated: true)
        }
        
        // cancel
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertVC.addAction(cameraAction)
        alertVC.addAction(libraryAction)
        alertVC.addAction(cancelAction)
        self.present(alertVC, animated: true)
    }
    
    // The picker does not dismiss when this method is called so you need to dismiss the picker yourself.
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        if !results.isEmpty {
            let results = results.first!
            let itemProvider = results.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                    guard let image = image as? UIImage else {
                        return
                    }
                    DispatchQueue.main.async {
                        let imageData = ["image": image]
                        NotificationCenter.default.post(name: .init("Changed image"), object: nil, userInfo: imageData)
                        self?.dismiss(animated: true)
                    }
                }
            }
        } else {
            self.dismiss(animated: true)
        }
    }
}
