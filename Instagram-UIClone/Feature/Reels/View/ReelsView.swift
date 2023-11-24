//
//  ReelsView.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 8.11.2023.
//

import Foundation
import SnapKit
import UIKit

class ReelsView : UIView {
   
    private var tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(ReelsCell.self, forCellReuseIdentifier: ReelsCell.identifier)
        return tableView
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
   
    
    private func setupView()
    {
        addSubview(tableView)
    }
    
    private func setupLayout()
    {
        tableView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension ReelsView : UITableViewDataSource , UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ReelsCell.identifier, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height
    }
}
   
