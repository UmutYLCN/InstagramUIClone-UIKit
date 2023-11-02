//
//  SearchResultView.swift
//  Instagram-UIClone
//
//  Created by umut yalçın on 2.11.2023.
//

import Foundation
import UIKit


class SearchResultView : UIView {
    
    var storys : [Story] = [
        Story(imgName: "pp", username: "Your story"),
        Story(imgName: "story1", username: "bedrock"),
        Story(imgName: "storyman1", username: "loudmouth"),
        Story(imgName: "story2", username: "smirk"),
        Story(imgName: "storyman2", username: "bullocks"),
        Story(imgName: "story3", username: "smack"),
        Story(imgName: "storyman3", username: "falcon"),
        Story(imgName: "story4", username: "vessel"),
        Story(imgName: "storyman4", username: "shrimp")
    ]
    
    
    private lazy var tableView : UITableView = {
        let tv = UITableView()
        tv.register(SearchResultCell.self, forCellReuseIdentifier: SearchResultCell.identifier)
        return tv
    }()
    
     init() {
         super.init(frame: .zero)
         setupView()
         setupLayout()
         tableView.delegate = self
         tableView.dataSource = self
    }
    
    
    
    private func setupView(){
        addSubview(tableView)
    }
    
    
    private func setupLayout(){
        tableView.snp.makeConstraints { make in
            make.width.height.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension SearchResultView : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultCell.identifier, for: indexPath) as! SearchResultCell
        
        cell.ResultConfigure(with: Story(imgName: storys[indexPath.row].imgName, username: storys[indexPath.row].username))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}

#Preview {
    SearchResultView()
}
