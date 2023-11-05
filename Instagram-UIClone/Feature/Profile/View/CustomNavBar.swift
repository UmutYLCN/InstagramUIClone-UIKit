//
//  CustomNavigationItem.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 2.11.2023.
//

import Foundation
import UIKit
import SnapKit

class CustomNavBar : UIView {
    
    private var usernameBtn : UIButton = {
        
        let btn = UIButton()
        let btnTitle = NSAttributedString(string: "umutylcnn_" ,attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 26, weight: .bold)])
        btn.setAttributedTitle(btnTitle, for: .normal)
        btn.addTarget(self, action: #selector(usernameBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    private var arrowBtn : UIButton = {
       let btn = UIButton()
        btn.setImage(.downArrow, for: .normal)
        
        btn.addTarget(self, action: #selector(arrowBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    private var addNewBtn : UIButton = {
       let btn = UIButton()
        btn.setBackgroundImage(.addnav, for: .normal)
        btn.addTarget(self, action: #selector(addBtnTapped), for: .touchUpInside)
        return btn
    }()
    private var settingsBtn : UIButton = {
       let btn = UIButton()
        btn.setImage(.setting, for: .normal)
        btn.addTarget(self, action: #selector(settingBtnTapped), for: .touchUpInside)
        return btn
    }()
    
    
    @objc func usernameBtnTapped(){
       print("username Tapped")
    }
    @objc func arrowBtnTapped(){
       print("arrow Tapped")
    }
    
    @objc func addBtnTapped(){
       print("add Tapped")
    }
    
    @objc func settingBtnTapped(){
       print("setting Tapped")
    }
    
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        addSubview(usernameBtn)
        addSubview(arrowBtn)
        addSubview(addNewBtn)
        addSubview(settingsBtn)
        
        usernameBtn.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        arrowBtn.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.width.equalTo(20)
            make.left.equalTo(usernameBtn.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
        
        addNewBtn.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.right.equalTo(settingsBtn.snp.left).offset(-25)
        }
        
        settingsBtn.snp.makeConstraints { make in
            make.width.height.equalTo(30)
            make.centerY.equalToSuperview()
            make.right.equalTo(-20)

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

#Preview {
    CustomNavBar()
}
