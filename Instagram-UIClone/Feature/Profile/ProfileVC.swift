//
//  ProfileVC.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 2.11.2023.
//

import UIKit

class ProfileVC: UIViewController {
    
    override func loadView() {
        super.loadView()
        let profileView = ProfileView()
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}


#Preview {
    UINavigationController(rootViewController: ProfileVC())
}
