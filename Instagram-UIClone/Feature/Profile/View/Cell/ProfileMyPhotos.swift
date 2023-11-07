//
//  ProfileMyPhotos.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 7.11.2023.
//

import UIKit

class ProfileMyPhotos: UICollectionViewCell {
    
    static let identifier = "ProfileMyPhotos"

    var imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        imageView.image = UIImage(named: "post")
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
