//
//  HomeView.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 27.10.2023.
//

import Foundation
import UIKit
import SnapKit


class HomeView : UIView {
    
    var posts : [Post] = [
        Post(
            profilPhoto: "story1",
            postPhoto: "post1",
            username: "bedrock",
            liked: false,
            saved: true,
            likedText: "Liked by smirk and others",
            commentCount: "View all 2,114 comments",
            description: "bedrock I have filmed a small vlog of north Dhaka, and I'm very excited to post on YouTube, will po...more",
            date: "1 day ago"),
        
        Post(
            profilPhoto: "storyman4",
            postPhoto: "post2",
            username: "shrimp",
            liked: false,
            saved: false,
            likedText: "Liked by loudmouth and others",
            commentCount: "View all 20 comments",
            description: "shrimp I have filmed a small vlog of north Dhaka, and I'm very excited to post on YouTube, will po...more",
            date: "20 day ago"),
        
        Post(
            profilPhoto: "story2",
            postPhoto: "post3",
            username: "smirk",
            liked: false,
            saved: false,
            likedText: "Liked by vessel and others",
            commentCount: "View all 5 comments",
            description: "smirk I have filmed a small vlog of north Dhaka, and I'm very excited to post on YouTube, will po...more",
            date: "2 day ago"),
        
        Post(
            profilPhoto: "storyman3",
            postPhoto: "post4",
            username: "falcon",
            liked: false,
            saved: false,
            likedText: "Liked by loudmouth and others",
            commentCount: "View all 56 comments",
            description: "falcon I have filmed a small vlog of north Dhaka, and I'm very excited to post on YouTube, will po...more",
            date: "18 day ago"),
        
        Post(
            profilPhoto: "story3",
            postPhoto: "post5",
            username: "smack",
            liked: false,
            saved: false,
            likedText: "Liked by bullocks and others",
            commentCount: "View all 13 comments",
            description: "smack I have filmed a small vlog of north Dhaka, and I'm very excited to post on YouTube, will po...more",
            date: "2 day ago"),
        
        Post(
            profilPhoto: "storyman2",
            postPhoto: "post6",
            username: "bullocks",
            liked: false,
            saved: false,
            likedText: "Liked by vessel and others",
            commentCount: "View all 38 comments",
            description: "bullocks I have filmed a small vlog of north Dhaka, and I'm very excited to post on YouTube, will po...more",
            date: "2 mounths ago"),
        
        Post(
            profilPhoto: "story4",
            postPhoto: "post7",
            username: "vessel",
            liked: false,
            saved: false,
            likedText: "Liked by falcon and others",
            commentCount: "View all 238 comments",
            description: "vessel I have filmed a small vlog of north Dhaka, and I'm very excited to post on YouTube, will po...more",
            date: "1 mounths ago"),
        
        Post(
            profilPhoto: "storyman1",
            postPhoto: "post8",
            username: "loudmouth",
            liked: false,
            saved: false,
            likedText: "Liked by bedrock and others",
            commentCount: "View all 51 comments",
            description: "loudmouth I have filmed a small vlog of north Dhaka, and I'm very excited to post on YouTube, will po...more",
            date: "20 day ago"),
        
        
        
    ]

    private var headerView : StoryHeaderUIView?
    
    private lazy var tableView : UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .systemBackground
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.showsVerticalScrollIndicator = false
        tableView.allowsSelection = false
        return tableView
    }()
    
    
     init(){
        super.init(frame: .zero)
        backgroundColor = .systemBackground
        setupView()
        setupLayout()
        tableView.delegate = self
        tableView.dataSource = self
        headerView =  StoryHeaderUIView(frame: CGRect(x: 0, y: 0, width: 0, height: 145))
        tableView.tableHeaderView = headerView
         
        
    }
    
    private func setupView(){
        addSubview(tableView)
    }
    
    private func setupLayout(){
        tableView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
    }

    
    @available(*, unavailable)
    required init(coder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



