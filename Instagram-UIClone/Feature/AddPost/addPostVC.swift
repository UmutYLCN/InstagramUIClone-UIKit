//
//  addPostVC.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 7.11.2023.
//
import Foundation
import UIKit

class addPostVC: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addpostView = addPostView(frame: UIScreen.main.bounds)
        view = addpostView
        configureNavBar()
        
    }
    

    private func configureNavBar(){
            
            self.navigationItem.leftBarButtonItems = [
                                              
            UIBarButtonItem(image: UIImage(systemName: "multiply")?
                .withConfiguration(UIImage.SymbolConfiguration(font: UIFont.systemFont(ofSize: 30, weight: .regular))),style: .plain, target: self, action: #selector(handleBackBtnTapped)),
            UIBarButtonItem(title: "New post", style: .plain, target: nil, action: nil)
                                                    
            ]
            
            navigationItem.leftBarButtonItems?.last?.setTitleTextAttributes(
                [
                    .font : UIFont.systemFont(ofSize: 26,weight: .bold),
                    .foregroundColor : UIColor.label,
                
                ], for: .normal)
            
        
            navigationItem.rightBarButtonItem =  UIBarButtonItem(image: UIImage(systemName: "arrow.forward",withConfiguration: UIImage.SymbolConfiguration(weight: .bold)), style: .done, target: self, action: #selector(handleUploadPost))
                       
                
            navigationController?.navigationBar.tintColor = .label
        }
    
    @objc
        func handleBackBtnTapped(){
            self.dismiss(animated: true)
        }
    
    @objc
        func handleUploadPost(){

            
        }
}
