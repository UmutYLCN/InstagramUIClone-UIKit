//
//  StoryCell.swift
//  TableViewHeader-Tutorial
//
//  Created by umut yalçın on 30.10.2023.
//



import UIKit
import SnapKit

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
    
    private lazy var addBlueBtn : UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "addStory")
        imageView.layer.cornerRadius = 14
        imageView.layer.masksToBounds = true
       return imageView
        
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(story)
        contentView.addSubview(storyUsername)
        contentView.addSubview(addBlueBtn)

        story.snp.makeConstraints { make in
            make.width.height.equalTo(88)
            make.center.centerX.equalToSuperview()
        }
        storyUsername.snp.makeConstraints { make in
            make.top.equalTo(story.snp.bottom).offset(5)
            make.leading.trailing.equalToSuperview()
        }
        
       
    }
    
    public func configure(with model : Story){
        story.image = UIImage(named: model.imgName)
        storyUsername.text = model.username
    }
    
    public func firstIndexActive(){
            addBlueBtn.snp.makeConstraints { make in
                make.height.width.equalTo(28)
                make.top.equalTo(story.snp.bottom).offset(-30)
                make.leading.equalTo(story.snp.trailing).offset(-30)
            }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    StoryCell()
}
