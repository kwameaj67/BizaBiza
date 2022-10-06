//
//  ReceiveMoneyVC.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 19/09/2022.
//

import UIKit

class ReceiveMoneyVC: UIViewController {
    private let options = ["Transfer","Payment Link","My QR Code"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Receive money"
        setupNavigationBar()
        setupViews()
        setupContraints()
    }
    func setupNavigationBar(){
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Color.blue
        appearance.titleTextAttributes =  [NSAttributedString.Key.font: UIFont(name: Font.bold.rawValue, size: 20)!,NSAttributedString.Key.foregroundColor:UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = appearance
        // hide nav line
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.layer.zPosition = -1
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.layer.zPosition = 0
    }
    // MARK: Properties -
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
    lazy var tableView : UITableView = {
        let tv = UITableView(frame: .zero, style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.register(AccountInfoCell.self, forCellReuseIdentifier: AccountInfoCell.reusableId)
        tv.register(ReceiveMoneyOptionsCell.self, forCellReuseIdentifier: ReceiveMoneyOptionsCell.reusableId)
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
        tv.allowsSelection = false
        tv.allowsMultipleSelection = false
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    let pageBottomView: CustomPageBottomView = {
        let v = CustomPageBottomView()
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    func setupViews(){
        view.addSubview(notificationView)
        view.addSubview(collectionView)
        view.addSubview(border)
        view.addSubview(tableView)
        view.addSubview(pageBottomView)
        pageBottomView.bringSubviewToFront(tableView)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            notificationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            notificationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            notificationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            notificationView.heightAnchor.constraint(equalToConstant: 65),
            
            collectionView.topAnchor.constraint(equalTo: notificationView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 65),
            
            border.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            border.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            border.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: 1),
            
            tableView.topAnchor.constraint(equalTo: border.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            pageBottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageBottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageBottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            pageBottomView.heightAnchor.constraint(equalToConstant: 120),
        ])
    }
    
}

extension ReceiveMoneyVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
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

extension ReceiveMoneyVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: AccountInfoCell.reusableId, for: indexPath) as! AccountInfoCell
            cell.layoutMargins = UIEdgeInsets.zero
            cell.separatorInset = UIEdgeInsets.zero
            return cell
        }
        else  if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: ReceiveMoneyOptionsCell.reusableId, for: indexPath) as! ReceiveMoneyOptionsCell
            cell.layoutMargins = UIEdgeInsets.zero
            cell.separatorInset = UIEdgeInsets.zero
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 440
        }
        else if indexPath.row == 1{
            return 400
        }
        return CGFloat()
    }
    
    
}
