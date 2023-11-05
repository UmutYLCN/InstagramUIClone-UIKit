//
//  ButtonRow.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 3.11.2023.
//

import Foundation
import SnapKit
import UIKit

class ButtonRow : UIView {
    
    private var editBtn : UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.black, for: .normal)
        
        let btnTitle = NSAttributedString(string: "Edit profile" ,attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)])
        
        btn.setAttributedTitle(btnTitle, for: .normal)
        btn.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        btn.titleLabel?.textAlignment = .center
        btn.layer.cornerRadius = 12
        return btn
    }()
    
    private var shareBtn : UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.black, for: .normal)
        
        let btnTitle = NSAttributedString(string: "Share profile" ,attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 16, weight: .bold)])
        
        btn.setAttributedTitle(btnTitle, for: .normal)
        btn.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        btn.titleLabel?.textAlignment = .center
        btn.layer.cornerRadius = 12
        return btn
    }()
    
    private var personBtn : UIButton = {
        let btn = UIButton()
        
        btn.setImage(UIImage(systemName: "person.badge.plus")?.withTintColor(.black, renderingMode: .alwaysOriginal), for: .normal)
        
        btn.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        
        btn.layer.cornerRadius = 12
        return btn
    }()

    
    init() {
        super.init(frame: .zero)
        setupView()
        setupLayout()
        
    }
    
    
    private func setupView()
    {
        addSubview(editBtn)
        addSubview(shareBtn)
        addSubview(personBtn)
    }
    private func setupLayout()
    {
        editBtn.snp.makeConstraints { make in
            make.width.equalTo(177)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.left.equalTo(10)
        }
        shareBtn.snp.makeConstraints { make in
            make.width.equalTo(177)
            make.centerY.equalToSuperview()
            make.height.equalTo(40)
            make.left.equalTo(editBtn.snp.right).offset(5)
        }
        personBtn.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.left.equalTo(shareBtn.snp.right).offset(5)
        }
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

#Preview {
    ButtonRow()
}
