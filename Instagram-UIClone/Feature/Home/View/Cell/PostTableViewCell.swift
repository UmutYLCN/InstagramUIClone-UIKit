//
//  PostTableViewCell.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 27.10.2023.
//

import Foundation
import UIKit
import SnapKit

class PostTableViewCell: UITableViewCell {

    static let identifier : String = "PostTableViewCell"

    
    private lazy var profilPhoto : UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "post")
           imageView.contentMode = .scaleAspectFill
           imageView.layer.borderWidth = 1
           imageView.layer.masksToBounds = true
           imageView.layer.borderColor = UIColor.label.cgColor
           imageView.backgroundColor = .lightGray
           imageView.layer.cornerRadius = Radius.medium.rawValue
           return imageView
    }()
    
    private lazy var postimageView : UIImageView = {
          let imageView = UIImageView()
          imageView.image = UIImage(named: "post")
          imageView.contentMode = .scaleAspectFill
          imageView.layer.masksToBounds = true
          return imageView
      }()
      
      private lazy var usernameLabel : UILabel = {
          let lbl = UILabel()
          lbl.text = "umutylcnn_"
          lbl.font = UIFont.systemFont(ofSize: FontSize.body,weight: .regular)
          lbl.textColor = .label
          return lbl
      }()
    
    private lazy var threeDot : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "more")?.withTintColor(.label)
        return imageView
    }()
    
    private let likeBtn : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "heart")
        imageView.tintColor = .label
        return imageView
    }()
        
    private let commentBtn : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mess")?.withTintColor(.label)
        return imageView
    }()
        
    private let shareBtn : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "send")?.withTintColor(.label)
        imageView.tintColor = .label
        return imageView
    }()
        
    private let saveBtn : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "save")
        imageView.tintColor = .label
        return imageView
    }()
    
    private lazy var likeCount : UILabel = {
        let lbl = UILabel()
        lbl.text = "Liked by umutylcnn_ and others"
        lbl.font = UIFont.systemFont(ofSize: FontSize.body, weight: .semibold)
        lbl.textColor = .label
        return lbl
    }()
    
    private lazy var descriptionLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "umutylcnn_ I have filmed a small vlog of north Dhaka, and I'm very excited to post on YouTube, will po...more"
        lbl.numberOfLines = 0
        lbl.font = UIFont.systemFont(ofSize: FontSize.body, weight: .regular)
        lbl.textColor = .label
        return lbl
    }()
    
    private lazy var commentCount : UILabel = {
        let lbl = UILabel()
        lbl.text = "View all 1,012 comments"
        lbl.font = UIFont.systemFont(ofSize: FontSize.body, weight: .semibold)
        lbl.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return lbl
    }()
    
    
    private lazy var dateLbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "1 day ago"
        lbl.font = UIFont.systemFont(ofSize: FontSize.smallCaption,weight: .regular)
        lbl.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        return lbl
    }()
    
  
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        contentView.addSubview(profilPhoto)
        contentView.addSubview(postimageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(threeDot)
        contentView.addSubview(likeBtn)
        contentView.addSubview(commentBtn)
        contentView.addSubview(shareBtn)
        contentView.addSubview(saveBtn)
        contentView.addSubview(likeCount)
        contentView.addSubview(descriptionLbl)
        contentView.addSubview(commentCount)
        contentView.addSubview(dateLbl)
        setupConstraints()
    }
    

    private func setupConstraints(){
        
        dateLbl.snp.makeConstraints { make in
            make.top.equalTo(commentCount.snp.bottom).offset(6)
            make.leading.equalTo(13)
        }
    
        commentCount.snp.makeConstraints { make in
            make.top.equalTo(descriptionLbl.snp.bottom).offset(6)
            make.leading.equalTo(13)
        }
        descriptionLbl.snp.makeConstraints { make in
            make.leading.equalTo(13)
            make.top.equalTo(likeCount.snp.bottom).offset(6)
            make.trailing.equalTo(-13)
        }
        
        likeCount.snp.makeConstraints { make in
            make.top.equalTo(likeBtn.snp.bottom).offset(13)
            make.leading.equalTo(13)
        }
        
        profilPhoto.snp.makeConstraints { make in
            make.height.width.equalTo(ButtonSize.semimedium.rawValue)
            make.leading.equalTo(10)
            make.top.equalTo(contentView.snp.top).offset(10)
        }
        usernameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profilPhoto.snp.trailing).offset(10)
            make.top.equalTo(contentView.snp.top).offset(18)
        }
        
        postimageView.snp.makeConstraints { make in
            make.top.equalTo(profilPhoto.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(550)
        }
        threeDot.snp.makeConstraints { make in
            make.trailing.equalTo(-10)
            make.height.width.equalTo(ButtonSize.small.rawValue)
            make.top.equalTo(contentView.snp.top).offset(16)
        }
        likeBtn.snp.makeConstraints { make in
            make.top.equalTo(postimageView.snp.bottom).offset(15)
            make.leading.equalTo(15)
            make.width.height.equalTo(ButtonSize.small.rawValue)
        }
        commentBtn.snp.makeConstraints { make in
            make.top.equalTo(postimageView.snp.bottom).offset(15)
            make.leading.equalTo(likeBtn.snp.trailing).offset(20)
            make.width.height.equalTo(ButtonSize.small.rawValue)
        }
        shareBtn.snp.makeConstraints { make in
            make.top.equalTo(postimageView.snp.bottom).offset(15)
            make.width.height.equalTo(ButtonSize.small.rawValue)
            make.leading.equalTo(commentBtn.snp.trailing).offset(20)
        }
        saveBtn.snp.makeConstraints { make in
            make.top.equalTo(postimageView.snp.bottom).offset(15)
            make.trailing.equalTo(-15)
            make.width.height.equalTo(ButtonSize.small.rawValue)
        }
        
    }
    
    
    public func postConfigure(with model : Post){
        profilPhoto.image = UIImage(named: model.profilPhoto)
        postimageView.image = UIImage(named: model.postPhoto)
        usernameLabel.text = model.username
        dateLbl.text = model.date
        descriptionLbl.text = model.description
        commentCount.text = model.commentCount
        likeCount.text = model.likedText
        
        if model.liked == true {
            likeBtn.image = UIImage(systemName: "heart.fill")
            likeBtn.tintColor = .red
        }
        if model.saved == true {
            saveBtn.image = UIImage(named: "savehover")
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
     
    
}



