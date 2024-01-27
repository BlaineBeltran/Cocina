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
        title.font = .preferredFont(forTextStyle: .body)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    let cellText: UILabel = {
        let text = UILabel()
        text.text = "thisismyusername"
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .blue
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    private func configureUI() {
        addSubview(cellTitle)
        addSubview(cellText)
        NSLayoutConstraint.activate([
            cellTitle.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellText.topAnchor.constraint(equalTo: cellTitle.bottomAnchor, constant: 5)
        ])
        
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
