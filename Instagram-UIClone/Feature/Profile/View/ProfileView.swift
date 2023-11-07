//
//  ProfileView.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 2.11.2023.
//

import Foundation
import UIKit
import SnapKit


class ProfileView : UIView {
    
    var customNav  = CustomNavBar()
    var overView = ProfileOverview()
    var buttonRow = ButtonRow()
    var postPhotos = ProfilePhotos()

    init(){
        super.init(frame: .zero)
        setupView()
        setupLayout()
    }

    
    private func setupView(){
        addSubview(customNav)
        addSubview(overView)
        addSubview(buttonRow)
        addSubview(postPhotos)
    }
    
    private func setupLayout(){
        customNav.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        overView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(customNav.snp.bottom).offset(80)
        }
        buttonRow.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(overView.snp.bottom).offset(140)
            make.height.equalTo(40)
        }
        postPhotos.snp.makeConstraints { make in
            make.top.equalTo(buttonRow.snp.bottom).offset(25)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
        
    }
    
    required init(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}



