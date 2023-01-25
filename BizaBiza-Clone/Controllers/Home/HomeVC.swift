//
//  ViewController.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 19/09/2022.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
      
        // custom back button
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: "chevon.left")
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(systemName: "chevon.left")
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: .none, action: .none)
        navigationController?.navigationBar.tintColor = .white
        setupViews()
        setupContraints()
        tableView.delaysContentTouches = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    // MARK: Properties -
    lazy var tableView : UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.delegate = self
        tv.dataSource = self
        tv.register(WalletBalanceCell.self, forCellReuseIdentifier: WalletBalanceCell.reusableId)
        tv.register(HeaderProfileView.self, forHeaderFooterViewReuseIdentifier: HeaderProfileView.reusableId)
        tv.register(WalletButtonsCell.self, forCellReuseIdentifier: WalletButtonsCell.reusableId)
        tv.register(TransactionCell.self, forCellReuseIdentifier: TransactionCell.reusableId)
        tv.register(ShopCell.self, forCellReuseIdentifier: ShopCell.reusableId)
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
        tv.separatorColor = .clear
        tv.allowsSelection = true
        tv.allowsMultipleSelection = true
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    func setupViews(){
        self.view.addSubview(tableView)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    @objc func receiveButtonPressed(){
        let vc = ReceiveMoneyVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func sendButtonPressed(){
        let vc = SendMoneyVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: WalletBalanceCell.reusableId) as! WalletBalanceCell
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.layoutMargins = UIEdgeInsets.zero
            cell.separatorInset = UIEdgeInsets.zero
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: WalletButtonsCell.reusableId) as! WalletButtonsCell
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.layoutMargins = UIEdgeInsets.zero
            cell.separatorInset = UIEdgeInsets.zero
            cell.selectionStyle = .none
            cell.controller = self
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TransactionCell.reusableId) as! TransactionCell
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.layoutMargins = UIEdgeInsets.zero
            cell.separatorInset = UIEdgeInsets.zero
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ShopCell.reusableId) as! ShopCell
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.layoutMargins = UIEdgeInsets.zero
            cell.separatorInset = UIEdgeInsets.zero
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0{
            return 190
        }
        else if indexPath.row == 1{
            return 140
        }
        else if indexPath.row == 2{
            return 60
        }
        else if indexPath.row == 3{
            return 240
        }
        return CGFloat()
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderProfileView.reusableId) as! HeaderProfileView
        return view
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }
    
}
