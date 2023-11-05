//
//  SearchView.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 30.10.2023.
//

import Foundation
import SnapKit
import UIKit


class SearchView : UIView {
    
    private var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: SearchView.createDiscoverLayout())
        cv.register(SearchPostCell.self, forCellWithReuseIdentifier: SearchPostCell.identifier)
        return cv
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupView(){
        addSubview(collectionView)
    }
    
    static func createDiscoverLayout() -> UICollectionViewCompositionalLayout{
        
        //MARK: Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)))
        
        let item2 = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(2/3),
                heightDimension: .fractionalHeight(1)))
        
        let verticalItem = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5)))
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        item2.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
        
        verticalItem.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
    
        //MARK: Group
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1.0)), repeatingSubitem: verticalItem , count: 2)
        
        let verticalGroup2 = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1/3),
            heightDimension: .fractionalHeight(1.0)), repeatingSubitem: verticalItem , count: 2)
        
        let group1 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(3/5)), subitems: [item,verticalGroup,verticalGroup2])
        
        let group2 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(3/5)), subitems: [verticalGroup2,verticalGroup,item])
        
        let group3 = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(3/5)), subitems: [item2,verticalGroup])
        
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(2.5)), subitems: [group2,group1,group3])
        
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )

        //MARK: Sections
        let section = NSCollectionLayoutSection(group: group)
        
        //MARK: return
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    
    
    private func setupLayout(){
        collectionView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SearchView : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 36
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchPostCell.identifier, for: indexPath) as! SearchPostCell
        return cell
    }
}


