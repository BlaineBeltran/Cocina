//
//  TitleDetailTableViewCell.swift
//  Cocina
//
//  Created by Andrea Jimenez on 3/3/24.
//

import UIKit

class TitleDetailTableViewCell: UITableViewCell {
    
    let icon: UIImageView = {
        let icon = UIImageView(image: UIImage(systemName: "icloud"))
        icon.tintColor = .background.ramenPrimary
        return icon
    }()
    
    let title: UILabel = {
        let title = UILabel()
        title.text = "iCloud Sync"
        return title
    }()
    
    let descriptionText: UILabel = {
        let description = UILabel()
        description.text = "When turned on, information is safely stored in iCloud and automatically kept in sync across all your devices."
        return description
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    private func configureUI() {
        
    }
    
}
