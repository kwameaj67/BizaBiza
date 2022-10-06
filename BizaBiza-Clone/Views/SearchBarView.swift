//
//  SearchBarView.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 25/09/2022.
//

import UIKit

class SearchBarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
    let border: UIView = {
        let view = UIView()
        view.backgroundColor = Color.border_bg
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setupViews(){
        addSubview(searchIcon)
        addSubview(searchField)
        addSubview(border)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            searchIcon.centerYAnchor.constraint(equalTo: centerYAnchor),
            searchIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            
            searchField.centerYAnchor.constraint(equalTo: searchIcon.centerYAnchor),
            searchField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 10),
            searchField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            border.bottomAnchor.constraint(equalTo: bottomAnchor),
            border.leadingAnchor.constraint(equalTo: leadingAnchor),
            border.trailingAnchor.constraint(equalTo: trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: 1)
        ])
    }

}
