//
//  PaymentVC.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 19/09/2022.
//

import UIKit

class PaymentVC: UIViewController {

    private let options = ["All","Payment Link","Agreement","Bizatoken","Emergency plan","Money Health","Bill Details"]
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Payments"
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
    let searchBarView: UIView = {
        let view = SearchBarView()
        view.searchField.placeholder = "Search anything..."
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
//        cv.register(SearchBarCollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchBarCollectionHeader.reusableId)
        cv.register(PageOptionCollectionCell.self, forCellWithReuseIdentifier: PageOptionCollectionCell.reusableId)
        cv.delegate = self
        cv.dataSource = self
        cv.isScrollEnabled = true
        cv.bounces = true
        cv.alwaysBounceHorizontal = true
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    lazy var tableView : UITableView = {
        let tv = UITableView(frame: .zero,style: .plain)
        tv.delegate = self
        tv.dataSource = self
        tv.register(BizaPaymentOptionCell.self, forCellReuseIdentifier: BizaPaymentOptionCell.reusableId)
        tv.register(RecentPaymentCell.self, forCellReuseIdentifier: RecentPaymentCell.reusableId)
        tv.register(InstantPaymentCell.self, forCellReuseIdentifier: InstantPaymentCell.reusableId)
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
        tv.allowsMultipleSelection = false
        tv.allowsSelection = false
        tv.separatorColor = Color.border_bg
        tv.separatorStyle = .singleLine
        tv.backgroundColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    let border: UIView = {
        let view = UIView()
        view.backgroundColor = Color.border_bg
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    func setupViews(){
        view.addSubview(collectionView)
        view.addSubview(tableView)
        view.addSubview(searchBarView)
        view.addSubview(border)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            searchBarView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            searchBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            searchBarView.heightAnchor.constraint(equalToConstant: 60),
            
            collectionView.topAnchor.constraint(equalTo: searchBarView.bottomAnchor,constant: 2),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 65),
            
            border.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            border.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            border.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            border.heightAnchor.constraint(equalToConstant: 1),
            
            tableView.topAnchor.constraint(equalTo: border.bottomAnchor,constant: 2),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension PaymentVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PageOptionCollectionCell.reusableId, for: indexPath) as! PageOptionCollectionCell
        cell.title.text = options[indexPath.row]
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
        return UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SearchBarCollectionHeader.reusableId, for: indexPath) as! SearchBarCollectionHeader
        header.searchField.placeholder = "Search anything..."
        return header
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: IndexPath(item: indexPath.row, section: 0), at: [.centeredHorizontally,.centeredVertically], animated: true)
        collectionView.layoutSubviews()
    }
    // collectionView header height
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
//        return CGSize(width: view.frame.size.width, height: 20)
//    }
    
}
extension PaymentVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: BizaPaymentOptionCell.reusableId, for: indexPath) as! BizaPaymentOptionCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
        else  if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: RecentPaymentCell.reusableId, for: indexPath) as! RecentPaymentCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
        else  if indexPath.row == 2{
            let cell = tableView.dequeueReusableCell(withIdentifier: InstantPaymentCell.reusableId, for: indexPath) as! InstantPaymentCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 200
        }
        else  if indexPath.row == 1 {
            return 150
        }
        else  if indexPath.row == 2 {
            return 200
        }
        return CGFloat()
    }
    
    
}
