//
//  EscrowVC.swift
//  BizaBiza-Clone
//
//  Created by Kwame Agyenim - Boateng on 19/09/2022.
//

import UIKit

class EscrowVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Escrow"
        setupNavigationBar()
        setupViews()
        setupContraints()
        view.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(hideKeyboard)))
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
    // MARK: Properties -
    lazy var tableView : UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.delegate = self
        tv.dataSource = self
        tv.register(SearchBarHeaderView.self, forHeaderFooterViewReuseIdentifier: SearchBarHeaderView.reusableId)
        tv.register(AgreementCell.self, forCellReuseIdentifier: AgreementCell.reusableId)
        tv.register(TransactionListCell.self, forCellReuseIdentifier: TransactionListCell.reusableId)
        tv.showsVerticalScrollIndicator = false
        tv.backgroundColor = .clear
        tv.allowsMultipleSelection = false
        tv.allowsSelection = false
        tv.tableHeaderView = UIView()
        tv.tableFooterView = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    func setupViews(){
        self.view.addSubview(tableView)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    @objc func hideKeyboard(){
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SearchBarHeaderView.reusableId) as! SearchBarHeaderView
        headerView.searchField.resignFirstResponder()
//        view.endEditing(true)
    }


}

extension EscrowVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if indexPath.row == 0{
            let cell =  tableView.dequeueReusableCell(withIdentifier: AgreementCell.reusableId, for: indexPath) as! AgreementCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
        else  if indexPath.row == 1{
            let cell =  tableView.dequeueReusableCell(withIdentifier: TransactionListCell.reusableId, for: indexPath) as! TransactionListCell
            cell.separatorInset = UIEdgeInsets.zero
            cell.layoutMargins = UIEdgeInsets.zero
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       if indexPath.row == 0{
            return 440
        }
        else if indexPath.row == 1{
            return 250
        }
        return CGFloat()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: SearchBarHeaderView.reusableId) as! SearchBarHeaderView
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 62
    }
    
}
