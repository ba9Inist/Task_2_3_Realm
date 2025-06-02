//
//  RandomCitationVC.swift
//  Task_2_3_Realm
//
//  Created by Егор Голубев on 29.05.2025.
//

import UIKit
import SnapKit

class RandomCitationVC: UIViewController {
    
    private lazy var citation: UILabel =  {
       let citation = UILabel()
        citation.textColor = .black
        citation.numberOfLines = 0
        citation.lineBreakMode = .byWordWrapping
        citation.font = UIFont(name: "", size: 20)
        return citation
    }()
    
    private lazy var buttonLoad: UIButton = {
        let button = UIButton()
        button.setTitle("Load citation", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(loadData), for: .touchUpInside)
        return button
    }()
    
    private lazy var networkManager = NetworkManager()
    private lazy var realmManager   = RealmManager()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setubSubviews()
    }
    
    private func setubSubviews() {
        
        view.addSubview(citation)
        view.addSubview(buttonLoad)
        
        citation.snp.makeConstraints{
            $0.centerX.equalTo(view.snp.centerX)
            $0.centerY.equalTo(view.snp.centerY)
            $0.left.equalTo(view.snp.left).inset(15)
            $0.right.equalTo(view.snp.right).inset(15)
            $0.height.equalTo(100)
        }
        
        buttonLoad.snp.makeConstraints{
            $0.top.equalTo(citation.snp.bottom).inset(-50)
            $0.left.equalTo(view.snp.left).inset(15)
            $0.right.equalTo(view.snp.right).inset(15)
            $0.height.equalTo(30)
        }
        
        
    }
    
    @objc private func loadData() {
        DispatchQueue.global(qos: .background).async {
            self.networkManager.getRandomCitation { result in
                switch result {
                case .success(let jsonStruct):
                    DispatchQueue.main.async {
                        self.citation.text = jsonStruct.value
                        self.realmManager.addCitation(jsonStrct: jsonStruct)
                        NotificationCenter.default.post(name: .reloadTableViews, object: nil)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}

extension Notification.Name {
    static let reloadTableViews = Notification.Name("ReloadTableViews")
}

