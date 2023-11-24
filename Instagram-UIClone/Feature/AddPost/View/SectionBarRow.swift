//
//  SectionBarRow.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 8.11.2023.
//

import Foundation
import UIKit
import SnapKit


class  SectionBarRow : UIView {
    
    private var RecentBtn : UIButton = {
        let btn = UIButton()
        let btnTitle = NSAttributedString(string: "Recents" ,attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 26, weight: .bold)])
        btn.setAttributedTitle(btnTitle, for: .normal)
        btn.addTarget(self, action: #selector(arrowBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    private var arrowBtn : UIButton = {
       let btn = UIButton()
        btn.setImage(.downArrow, for: .normal)
        btn.addTarget(self, action: #selector(arrowBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    
    private var rightBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "camera"),for: .normal)
        btn.imageView?.tintColor = .systemBackground
        btn.layer.backgroundColor = UIColor.lightGray.cgColor
        btn.layer.cornerRadius = 20
        return btn
    }()
    private var rightBtn2 : UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "square.3.layers.3d.down.left"), for: .normal)
        btn.imageView?.tintColor = .systemBackground
        btn.layer.backgroundColor = UIColor.lightGray.cgColor
        btn.layer.cornerRadius = 20
        return btn
    }()
    
    @objc func arrowBtnTapped(){
       print("arrow Tapped")
    }
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        addSubview(RecentBtn)
        addSubview(arrowBtn)
        addSubview(rightBtn)
        addSubview(rightBtn2)
        
        RecentBtn.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        arrowBtn.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.left.equalTo(RecentBtn.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
        
        rightBtn.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.right.equalTo(-20)
        }
        rightBtn2.snp.makeConstraints { make in
            make.width.height.equalTo(40)
            make.centerY.equalToSuperview()
            make.right.equalTo(rightBtn.snp.left).offset(-10)
        }
        
    
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

