//
//  EditProfileTableViewCell.swift
//  Cocina
//
//  Created by Andrea Jimenez on 1/26/24.
//

import UIKit
import SwiftUI

class EditProfileTableViewCell: UITableViewCell {
    
    let cellTitle: UILabel = {
        let title = UILabel()
        title.text = "Username"
        title.font = .ramenFont(for: .bodyS)
        title.textColor = UIColor.text.primary
        return title
    }()
    
    var textField: UITextField = {
        let textField = UITextField()
        textField.text = "text"
        textField.placeholder = "placeholder"
        textField.font = .ramenFont(for: .bodyS)
        textField.textColor = UIColor.text.primary
        textField.returnKeyType = .done
        return textField
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func configureUI() {
        /// Discussion:  Adding subview to ContentView vs TableViewCell directly
        /// The content view is resized automatically.
        contentView.addSubview(cellTitle)
        contentView.addSubview(textField)
        cellTitle.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(10)
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.trailing.equalTo(contentView.snp.trailing)
        }
        textField.snp.makeConstraints { make in
            make.leading.equalTo(contentView.snp.leading).offset(10)
            make.top.equalTo(cellTitle.snp.bottom).offset(10)
            make.trailing.equalTo(contentView.snp.trailing)
            make.bottom.equalTo(contentView.snp.bottom).inset(10)
        }
    }
}

struct EditProfileTableViewCellPreview: PreviewProvider {
    
    static var previews: some View {
        CellPreviewContainer().frame(width: UIScreen.main.bounds.width, height: 50, alignment: .center)
    }
    
    struct CellPreviewContainer: UIViewRepresentable {
        
        func makeUIView(context: UIViewRepresentableContext<EditProfileTableViewCellPreview.CellPreviewContainer>) -> UITableViewCell {
            return EditProfileTableViewCell()
        }
        
        func updateUIView(_ uiView: UITableViewCell, context: UIViewRepresentableContext<EditProfileTableViewCellPreview.CellPreviewContainer>) {
        }
        
        typealias UIViewType = UITableViewCell
    }

}
