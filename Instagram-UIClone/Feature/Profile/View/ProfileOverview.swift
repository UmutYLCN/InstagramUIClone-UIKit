//
//  ProfileOverview.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 3.11.2023.
//

import Foundation
import SnapKit
import UIKit



class ProfileOverview : UIView {
    
    private var profilPhoto : UIImageView = {
           let imageView = UIImageView()
           imageView.image = UIImage(named: "post")
           imageView.contentMode = .scaleAspectFill
           imageView.layer.masksToBounds = true
           imageView.layer.cornerRadius = 50
           return imageView
    }()
    private var nameLbl : UILabel = {
       let lbl = UILabel()
       lbl.text = "Umut"
        lbl.font = UIFont.systemFont(ofSize: FontSize.subHeadline,weight: .bold)
       return lbl
    }()
    private var descLbl : UILabel = {
       let lbl = UILabel()
       lbl.text = "Lorem ipsum"
       lbl.numberOfLines = 0
       lbl.font = UIFont.systemFont(ofSize: FontSize.body)
       return lbl
    }()
    
    private var view1 : UIView = {
        let view = UIView()
        return view
    }()
    
    private var view2 : UIView = {
        let view = UIView()

        return view
    }()
    private var view3 : UIView = {
        let view = UIView()
        
        return view
    }()
    
    private func createOverView(count : String , text : String , mainView : UIView){
        let lbl = UILabel()
        lbl.text = "\(count)"
        lbl.font = UIFont.systemFont(ofSize: 25,weight: .bold)
    
        let lbl2 = UILabel()
        lbl2.text = "\(text)"
        lbl2.font = UIFont.systemFont(ofSize: FontSize.body)
        
        mainView.addSubview(lbl)
        mainView.addSubview(lbl2)
        
        lbl2.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(lbl.snp.bottom).offset(2)
        }
        lbl.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-5)
        }
    }
    
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupLayout()
        createOverView(count: "10", text: "Posts", mainView: view1)
        createOverView(count: "24", text: "Followers", mainView: view2)
        createOverView(count: "55", text: "Following", mainView: view3)
    }
    
    private func setupView(){
        addSubview(profilPhoto)
        addSubview(nameLbl)
        addSubview(descLbl)
        addSubview(view1)
        addSubview(view2)
        addSubview(view3)
    }
    
    private func setupLayout(){
        profilPhoto.snp.makeConstraints { make in
            make.width.height.equalTo(100)
            make.centerY.equalToSuperview()
            make.left.equalTo(20)
        }
        nameLbl.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(profilPhoto.snp.bottom).offset(5)
        }
        
        descLbl.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(nameLbl.snp.bottom).offset(5)
        }
        
        view1.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.left.equalTo(profilPhoto.snp.right).offset(30)
            make.centerY.equalToSuperview()
        }
        
        view2.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.left.equalTo(view1.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
        view3.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.left.equalTo(view2.snp.right).offset(10)
            make.centerY.equalToSuperview()
        }
       
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}





