//
//  StoryHeaderUIView.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 29.10.2023.
//

import Foundation
import SnapKit
import UIKit

class StoryHeaderUIView : UIView {
    
    
    var storys : [Story] = [
        Story(imgName: "pp", username: "Your story"),
        Story(imgName: "story1", username: "bedrock"),
        Story(imgName: "storyman1", username: "loudmouth"),
        Story(imgName: "story2", username: "smirk"),
        Story(imgName: "storyman2", username: "bullocks"),
        Story(imgName: "story3", username: "smack"),
        Story(imgName: "storyman3", username: "falcon"),
        Story(imgName: "story4", username: "vessel"),
        Story(imgName: "storyman4", username: "shrimp")
    ]
    
    private lazy var collectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(StoryCell.self, forCellWithReuseIdentifier: StoryCell.identifier)
       return cv
    }()
    
    
    override init(frame : CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
        collectionView.dataSource = self
        collectionView.delegate  = self
        collectionView.backgroundColor = .systemBackground
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupView(){
        addSubview(collectionView)
    }
    
    private func setupLayout(){
        collectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview().offset(-15)
            make.height.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension StoryHeaderUIView : UICollectionViewDataSource ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storys.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCell.identifier, for: indexPath) as! StoryCell
        cell.configure(with: Story(imgName: storys[indexPath.row].imgName, username: storys[indexPath.row].username))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/4.5, height: collectionView.frame.height / 2)
    }
}
