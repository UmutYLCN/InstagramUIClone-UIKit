//
//  addPostView.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 7.11.2023.
//

import Foundation
import UIKit
import SnapKit


class addPostView : UIView {
    
    private var isAspectControl = false
    
    let images : [UIImage] = [
        UIImage(named: "0"),
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3"),
        UIImage(named: "4"),
        UIImage(named: "5"),
        UIImage(named: "6"),
        UIImage(named: "7"),
        UIImage(named: "8"),
        UIImage(named: "9"),
        UIImage(named: "10"),
        UIImage(named: "11"),
        UIImage(named: "12"),
        UIImage(named: "13"),
        UIImage(named: "14"),
        UIImage(named: "15"),
        UIImage(named: "16"),
        UIImage(named: "17"),
    ].compactMap({ $0 })
    
    var sectionBar = SectionBarRow()
    
    private let imageview : UIImageView = {
           let imageView = UIImageView()
            imageView.backgroundColor = .systemBackground
            imageView.image = UIImage(named: "story1")
            imageView.contentMode = .scaleToFill
            
            return imageView
    }()
    
    private var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: addPostView.createDiscoverLayout())
        cv.register(ProfileMyPhotosCell.self, forCellWithReuseIdentifier: ProfileMyPhotosCell.identifier)
        return cv
    }()
    
    private var toScaleBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "arrow.down.left.and.arrow.up.right"),for: .normal)
        btn.imageView?.tintColor = .systemBackground
        btn.layer.backgroundColor = UIColor.lightGray.cgColor
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        setupView()
        setupLayout()
        toScaleBtn.addTarget(self, action: #selector(toScaleBtnTapped), for: .touchUpInside)
        
    }
    
    static func createDiscoverLayout() -> UICollectionViewCompositionalLayout{
        
        //MARK: Item
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1/4),
                heightDimension: .fractionalHeight(1)))
    
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 1, bottom: 2, trailing: 1
        )

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/4)), subitems: [item])
        //MARK: Sections
        let section = NSCollectionLayoutSection(group: group)
        //MARK: return
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    
    private func setupView(){
        addSubview(imageview)
        addSubview(sectionBar)
        addSubview(collectionView)
        imageview.addSubview(toScaleBtn)
        imageview.isUserInteractionEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
     @objc func toScaleBtnTapped(){
         
         if isAspectControl == false {
             isAspectControl = true
             imageview.contentMode = .scaleAspectFit
             
         }else {
             isAspectControl = false
             imageview.contentMode = .scaleToFill
         }
    }
    
    private func setupLayout(){
        imageview.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.height.equalTo(snp.height).multipliedBy(0.45)
        }
        sectionBar.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(70)
            make.top.equalTo(imageview.snp.bottom)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(sectionBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        toScaleBtn.snp.makeConstraints { make in
            make.bottom.equalTo(-20)
            make.width.height.equalTo(40)
            make.left.equalTo(20)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension addPostView : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileMyPhotosCell.identifier, for: indexPath) as! ProfileMyPhotosCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        imageview.image = UIImage(named: "\(indexPath.row)")
    }
}

