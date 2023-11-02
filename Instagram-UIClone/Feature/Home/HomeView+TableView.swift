//
//  HomeVC+TableView.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 27.10.2023.
//

import Foundation
import UIKit


extension HomeView : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        cell.postConfigure(with: Post(profilPhoto: posts[indexPath.row].profilPhoto, postPhoto: posts[indexPath.row].postPhoto, username: posts[indexPath.row].username, liked: posts[indexPath.row].liked, saved: posts[indexPath.row].saved, likedText: posts[indexPath.row].likedText, commentCount: posts[indexPath.row].commentCount, description: posts[indexPath.row].description, date: posts[indexPath.row].date))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.85
    }
}
