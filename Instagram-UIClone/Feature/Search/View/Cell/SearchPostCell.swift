//
//  SearchPostCell.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 31.10.2023.
//

import UIKit

class SearchPostCell: UICollectionViewCell {
    
    static let identifier = "SearchPostCell"

    private lazy var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        let images : [UIImage] = [
            UIImage(named: "post"),
            UIImage(named: "post1"),
            UIImage(named: "post2"),
            UIImage(named: "post3"),
            UIImage(named: "post4"),
            UIImage(named: "post5"),
            UIImage(named: "post6"),
            UIImage(named: "post7"),
            UIImage(named: "post8"),
            UIImage(named: "story1"),
            UIImage(named: "pp"),
            UIImage(named: "story2"),
            UIImage(named: "story3"),
            UIImage(named: "story4"),
            UIImage(named: "storyman1"),
            UIImage(named: "storyman2"),
            UIImage(named: "storyman3"),
            UIImage(named: "storyman4"),
        ].compactMap({ $0 })
        
        imageView.image = images.randomElement()
        contentView.clipsToBounds = true
    }
    
    private func setupUI(){
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    

}
