//
//  ProfilePhotos.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 6.11.2023.
//

import Foundation
import UIKit
import SnapKit

class ProfilePhotos : UIView {
    
    let images : [UIImage] = [
        UIImage(named: "storyman1"),
        UIImage(named: "storyman2"),
        UIImage(named: "storyman3"),
        UIImage(named: "storyman4"),
    ].compactMap({ $0 })
    
    private var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: ProfilePhotos.createDiscoverLayout())
        cv.register(ProfileMyPhotosCell.self, forCellWithReuseIdentifier: ProfileMyPhotosCell.identifier)
        return cv
    }()
    
    init() {
        super.init(frame: .zero)
        
        let segmented = CustomSegmented(frame: CGRect(x: 0, y:20, width: UIScreen.main.bounds.width, height: 20), buttonTitle: ["square.grid.3x3.topleft.filled","person.crop.rectangle"])
        addSubview(segmented)
      
        segmented.delegate = self
        
        addSubview(collectionView)
        collectionView.frame = CGRect(x: 0, y: segmented.frame.maxY + 10, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)

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
            top: 0, leading: 1, bottom: 2, trailing: 1
        )

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1/3)), subitems: [item])
        //MARK: Sections
        let section = NSCollectionLayoutSection(group: group)
        //MARK: return
        return UICollectionViewCompositionalLayout(section: section)
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfilePhotos : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileMyPhotosCell.identifier, for: indexPath) as! ProfileMyPhotosCell
        cell.imageView.image = images[indexPath.row]
        return cell
    }
}


extension ProfilePhotos : CustomSegmentedDelegate {
    func change(to index: Int) {
        switch index {
        case 0:
            collectionView.isHidden = false
        case 1:
            collectionView.isHidden = true
        default:
            break
        }
    }
}
