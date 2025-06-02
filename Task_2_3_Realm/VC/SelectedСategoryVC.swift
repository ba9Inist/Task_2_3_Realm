//
//  SelectedСategoryVC.swift
//  Task_2_3_Realm
//
//  Created by Егор Голубев on 02.06.2025.
//

import UIKit
import SnapKit

class SelectedCategoryVC: UIViewController {
    
    private lazy var citationsTableView: UITableView = {
       let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellTableView")
       return tableView
    }()
   
    private lazy var arrayCitations = [CitationRealm]()
    private lazy var realmManager = RealmManager()
    lazy var cellData = CategoryRealm()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        addSubviews()
        title = cellData.category
        arrayCitations = realmManager.loadSelectedCitations(category: cellData.category)
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
    

}

extension SelectedCategoryVC: UITableViewDelegate {
    
}

extension SelectedCategoryVC: UITableViewDataSource {
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
