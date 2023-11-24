//
//  ReelsCell.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 8.11.2023.
//

import UIKit

class ReelsCell: UITableViewCell {

    static let identifier = "ReelsCell"
    
    private var reelsImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        setupUI()
        setupConstraints()
    }
    
    
    
    
    private func setupUI(){
        reelsImageView.image = UIImage(named: "post")
        contentView.clipsToBounds = true
        contentView.addSubview(reelsImageView)
    }
    
    private func setupConstraints(){
       
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        reelsImageView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
