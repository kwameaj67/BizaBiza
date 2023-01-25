//
//  AccountInfoCell.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 29/09/2022.
//

import UIKit

class AccountInfoCell: UITableViewCell {

    static let reusableId = "AccountInfoCell"
    private let options = ["Transfer","Payment Link","My QR Code"]
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: AccountInfoCell.reusableId)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: Properties -
    lazy var notificationView: NotificationView = {
        let view = NotificationView(frame: .zero)
        view.titleLabel.textColor = Color.grey
        view.backgroundColor = .white
        view.todayBtn.isHidden = true
        view.icon.image = UIImage(named: "notification-grey")?.withRenderingMode(.alwaysOriginal)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var collectionView : UICollectionView = {
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 30
        layout.minimumLineSpacing = 30
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
        cv.setCollectionViewLayout(layout, animated: false)
        cv.backgroundColor = .clear
        cv.register(PageOptionCollectionCell.self, forCellWithReuseIdentifier: PageOptionCollectionCell.reusableId)
        cv.delegate = self
        cv.dataSource = self
        cv.isScrollEnabled = true
        cv.isPagingEnabled = true
        cv.allowsSelection = true
        cv.bounces = true
        cv.alwaysBounceHorizontal = true
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    let border: UIView = {
        let b = UIView()
        b.backgroundColor = Color.border_bg
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    let infoContainer: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.alignment = .center
        sv.backgroundColor = .clear
        sv.layer.borderWidth = 1
        sv.layer.borderColor = Color.border_bg.cgColor
        sv.layer.cornerRadius = 15
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let buttonContainer: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.alignment = .center
        sv.backgroundColor = .clear
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    let nameLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let accountNumberLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let bankNameLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textAlignment = .center
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let copyButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Copy", for: .normal)
        btn.setTitleColor(Color.blue, for: .normal)
        btn.titleLabel?.font = UIFont(name: Font.medium.rawValue, size: 16)
        btn.setImage(UIImage(named: "copy")?.withRenderingMode(.alwaysTemplate), for: .normal)
        btn.semanticContentAttribute = .forceLeftToRight
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        btn.backgroundColor = .none
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Color.border_bg.cgColor
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let shareButton: UIButton = {
        var btn = UIButton()
        btn.setTitle("Share", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont(name: Font.medium.rawValue, size: 16)
        btn.backgroundColor = .none
        btn.layer.borderWidth = 1
        btn.layer.borderColor = Color.border_bg.cgColor
        btn.layer.cornerRadius = 10
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupViews(){
        contentView.addSubview(notificationView)
        contentView.addSubview(collectionView)
        contentView.addSubview(border)
        contentView.addSubview(infoContainer)
        [nameLabel,accountNumberLabel,bankNameLabel].forEach{
            infoContainer.addArrangedSubview($0)
        }
        contentView.addSubview(buttonContainer)
        [copyButton,shareButton].forEach{
            buttonContainer.addArrangedSubview($0)
        }
        nameLabel.attributedText = setupAttributedText("Name", "Kwame Boateng")
        accountNumberLabel.attributedText = setupAttributedText("Account number", "1002747349")
        bankNameLabel.attributedText = setupAttributedText("Bank name", "BIZA WALLET")
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            notificationView.topAnchor.constraint(equalTo: contentView.topAnchor),
            notificationView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            notificationView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            notificationView.heightAnchor.constraint(equalToConstant: 65),
            
            collectionView.topAnchor.constraint(equalTo: notificationView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 65),
            
            border.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            border.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            border.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: 1),
            
            infoContainer.topAnchor.constraint(equalTo: border.bottomAnchor, constant: 30),
            infoContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            infoContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            infoContainer.heightAnchor.constraint(equalToConstant: 290),
            
            buttonContainer.topAnchor.constraint(equalTo: infoContainer.bottomAnchor, constant: 20),
            buttonContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 60),
            buttonContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -60),
            buttonContainer.heightAnchor.constraint(equalToConstant: 60),
            
            copyButton.heightAnchor.constraint(equalToConstant: 54),
            shareButton.heightAnchor.constraint(equalToConstant: 54),
        ])
    }
    func setupAttributedText(_ title: String, _ subTitle: String) -> NSAttributedString {
        let text = NSMutableAttributedString(attributedString: NSAttributedString(string: "\(title):\n\n", attributes: [NSAttributedString.Key.foregroundColor: Color.grey,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 16)!]))
        text.append(NSAttributedString(string: "\(subTitle)", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black,NSAttributedString.Key.font: UIFont(name: Font.medium.rawValue, size: 18)!]))
        return text
    }
}

extension AccountInfoCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageOptionCollectionCell.reusableId, for: indexPath) as! PageOptionCollectionCell
        cell.title.text = options[indexPath.row]
        cell.border.backgroundColor = Color.blue
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = options[indexPath.row]
        let itemSize = item.size(withAttributes: [NSAttributedString.Key.font:UIFont(name: Font.medium.rawValue, size: 15)!])
        return CGSize(width: itemSize.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // center cells
        let totalCellWidth = 80 * collectionView.numberOfItems(inSection: 0)
        let totalSpacingWidth = 10 * (collectionView.numberOfItems(inSection: 0) - 1)

        let leftInset = (collectionView.layer.frame.size.width - CGFloat(totalCellWidth + totalSpacingWidth)) / 2
        let rightInset = leftInset

        return UIEdgeInsets(top: 0, left: leftInset, bottom: 0, right: rightInset)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: IndexPath(item: indexPath.row, section: 0), at: [.centeredHorizontally,.centeredVertically], animated: true)
        collectionView.layoutSubviews()
    }
}
