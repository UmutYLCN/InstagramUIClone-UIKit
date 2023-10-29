//
//  HomeView.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 27.10.2023.
//

import Foundation
import UIKit
import SnapKit


class HomeView : UIView {

   
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
    
    private lazy var collectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
       return cv
    }()
    
    
    init(){
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        setupView()
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate  = self
        
    }
    
    private func setupView(){
        addSubview(tableView)
        addSubview(collectionView)
        
        
    }
    
    private func setupLayout(){
        tableView.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview()
            make.top.equalTo(collectionView.snp.bottom)
        }
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalToSuperview().multipliedBy(0.25)
        }
    }
    
    @available(*, unavailable)
    required init(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

#Preview {
    HomeView()
}
