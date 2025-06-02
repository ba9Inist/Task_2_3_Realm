//
//  ListVC.swift
//  Task_2_3_Realm
//
//  Created by Егор Голубев on 29.05.2025.
//

import UIKit
import SnapKit

class ListVC: UIViewController {
    
    lazy var refreshIndicator: UIRefreshControl = {
         let control = UIRefreshControl()
         control.addTarget(self, action: #selector(reloadTableView), for: .valueChanged)
         return control
     }()
    
    private lazy var citationsTableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellTableView")
        tableView.refreshControl = refreshIndicator
       return tableView
    }()
    
    private lazy var arrayCitations = [CitationRealm]()
    private lazy var realmManager = RealmManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        arrayCitations = realmManager.loadCitations()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadTableView), name: .reloadTableViews, object: nil)
     }

     deinit {
         NotificationCenter.default.removeObserver(self)
     }
    
    private func addSubviews() {
        view.addSubview(citationsTableView)
        citationsTableView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(view.snp.left)
            $0.right.equalTo(view.snp.right)
            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    
    @objc private func reloadTableView(){
        DispatchQueue.main.async {
            self.arrayCitations = self.realmManager.loadCitations()
            self.citationsTableView.reloadData()
            self.refreshIndicator.endRefreshing()
        }
    }
    
}

extension ListVC: UITableViewDelegate {
    
}

extension ListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCitations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var config = UIListContentConfiguration.cell()
        config.text = arrayCitations[indexPath.row].citation
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        let stringRepresentation = dateFormatter.string(from: arrayCitations[indexPath.row].date)
        config.secondaryText = stringRepresentation
        cell.contentConfiguration = config
        return cell
    }
    
    
}

