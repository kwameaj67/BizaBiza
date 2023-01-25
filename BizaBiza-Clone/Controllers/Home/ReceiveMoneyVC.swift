//
//  ReceiveMoneyVC.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 19/09/2022.
//

import UIKit

class ReceiveMoneyVC: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Receive money"
        setupNavigationBar()
        setupViews()
        setupContraints()
    }
    func setupNavigationBar(){
        navigationController?.navigationBar.isHidden = false
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
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.layer.zPosition = -1
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.tabBar.isHidden = false
        tabBarController?.tabBar.layer.zPosition = 0
    }
    // MARK: Properties -
    
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
        view.addSubview(tableView)
        view.addSubview(pageBottomView)
        pageBottomView.bringSubviewToFront(tableView)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
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
            return 570
        }
        else if indexPath.row == 1{
            return 370
        }
        return CGFloat()
    }
    
    
}
