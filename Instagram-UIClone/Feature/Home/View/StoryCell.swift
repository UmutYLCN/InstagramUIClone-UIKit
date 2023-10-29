//
//  StoryCell.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 28.10.2023.
//

import UIKit

class StoryCell: UICollectionViewCell {
    static let identifier : String = "StoryCell"
    
    
    private lazy var story : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "post")
        imageView.layer.cornerRadius = 44
        imageView.contentMode = .scaleToFill
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.masksToBounds = true
       return imageView
        
    }()
    
    private lazy var storyUsername : UILabel = {
       let lbl = UILabel()
        lbl.text = "sudeylcnn_"
        lbl.textColor = .label
        lbl.font = UIFont.systemFont(ofSize: FontSize.caption)
        lbl.textAlignment = .center
       return lbl
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(story)
        contentView.addSubview(storyUsername)

        story.snp.makeConstraints { make in
            make.width.height.equalTo(88)
            make.center.centerX.equalToSuperview()
        }
        storyUsername.snp.makeConstraints { make in
            make.top.equalTo(story.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
            
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

#Preview {
    StoryCell()
}
