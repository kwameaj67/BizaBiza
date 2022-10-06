//
//  SearchBarCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 24/09/2022.
//

import UIKit

class SearchBarHeaderView: UITableViewHeaderFooterView {

    static let reusableId = "SearchBarCell"
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: SearchBarHeaderView.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let searchIcon : UIImageView = {
        var iv = UIImageView(frame: .zero)
        iv.image = UIImage(named: "search")?.withRenderingMode(.alwaysOriginal)
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let searchField: UITextField = {
        var field = UITextField()
        field.borderStyle = .none
        field.textColor = Color.grey
        field.font = UIFont(name: Font.medium.rawValue, size: 15)
        field.attributedPlaceholder = NSAttributedString(string: "Search escrow transactions", attributes: [NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 15)!])
        field.autocorrectionType = .no
        field.clearButtonMode = .whileEditing
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    func setupViews(){
        contentView.addSubview(searchIcon)
        contentView.addSubview(searchField)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            searchIcon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            searchIcon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            
            searchField.centerYAnchor.constraint(equalTo: searchIcon.centerYAnchor),
            searchField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 10),
//            searchField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
                   
        ])
    }
}
