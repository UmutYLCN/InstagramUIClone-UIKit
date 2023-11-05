//
//  ProfileView.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 2.11.2023.
//

import Foundation
import UIKit
import SnapKit


class ProfileView : UIView {
    
    var customNav  = CustomNavBar()
    var overView = ProfileOverview()
    var buttonRow = ButtonRow()
    
    private var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: ProfileView.createDiscoverLayout())
        cv.register(SearchPostCell.self, forCellWithReuseIdentifier: SearchPostCell.identifier)
        return cv
    }()
    

    init(){
        super.init(frame: .zero)
        setupView()
        setupLayout()
        let segmented = CustomSegmented(frame: CGRect(x: 0, y:370, width: UIScreen.main.bounds.size.width, height: 50), buttonTitle: ["search","reelsIcon"])
        addSubview(segmented)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmented.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    static func createDiscoverLayout() -> UICollectionViewCompositionalLayout{
        
        //MARK: Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/3),
                heightDimension: .fractionalHeight(1)))
    
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 2, leading: 2, bottom: 2, trailing: 2
        )
      
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(2.5)), repeatingSubitem : item, count: 2)

        //MARK: Sections
        let section = NSCollectionLayoutSection(group: group)
        
        //MARK: return
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    
    private func setupView(){
        addSubview(customNav)
        addSubview(overView)
        addSubview(buttonRow)
    }
    
    private func setupLayout(){
        customNav.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        overView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(customNav.snp.bottom).offset(80)
        }
        buttonRow.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(overView.snp.bottom).offset(140)
        }
        
    }
    
    required init(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension ProfileView : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchPostCell.identifier, for: indexPath) as! SearchPostCell
        return cell
    }
}


#Preview {
    ProfileView()
}
