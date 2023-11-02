//
//  SearchResultCell.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 2.11.2023.
//

import UIKit

class SearchResultCell: UITableViewCell {

    static let identifier = "SearchResultCell"

    private var imgView : UIImageView = {
       
        let imgView = UIImageView()
        imgView.image = UIImage(named: "post")
        imgView.contentMode = .scaleAspectFill
        imgView.layer.borderWidth = 1
        imgView.layer.masksToBounds = true
        imgView.layer.cornerRadius = 40
        return imgView
    }()
    
    private var usernamelbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "bedrock"
        lbl.font = UIFont.systemFont(ofSize: FontSize.subHeadline , weight: .bold)
        return lbl
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setupUI()
        setupConstraints()
    }
    
    
    private func setupUI(){
        contentView.addSubview(imgView)
        contentView.addSubview(usernamelbl)
    }
    
    private func setupConstraints(){
        imgView.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.left.equalTo(20)
            make.centerY.equalToSuperview()
        }
        usernamelbl.snp.makeConstraints { make in
            make.left.equalTo(imgView.snp.right).offset(20)
            make.centerY.equalToSuperview()
        }
    }
    
    
    public func ResultConfigure(with model : Story){
        imgView.image = UIImage(named: model.imgName)
        usernamelbl.text = model.username
    }
    

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

