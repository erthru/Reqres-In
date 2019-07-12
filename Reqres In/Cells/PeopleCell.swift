//
//  PeopleCell.swift
//  Reqres In
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
import SnapKit

class PeopleCell: UITableViewCell {
    
    private let lbName = UILabel()
    private let lbEmail = UILabel()
    private let imgAvatar = UIImageView(image: UIImage(named: "img_placeholder"))
    
    func build(people: People){
        
        setupUI()
        
        lbName.text = "\(people.lastName), \(people.firstName)"
        lbEmail.text = people.email
        imgAvatar.kf.setImage(with: URL(string: people.avatar))
    }
    
    func setupUI(){
        
        // view
        self.addSubview(lbName)
        self.addSubview(lbEmail)
        self.addSubview(imgAvatar)
        
        // imgAvatar
        imgAvatar.snp.makeConstraints({ make in
            make.top.equalTo(self.snp.top).offset(16)
            make.leading.equalTo(self.snp.leading).offset(16)
            make.bottom.equalTo(self.snp.bottom).offset(-16)
            make.height.equalTo(70)
            make.width.equalTo(70)
        })
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 70 / 2
        
        // lbName
        lbName.snp.makeConstraints({ make in
            make.top.equalTo(self.snp.top).offset(26)
            make.leading.equalTo(imgAvatar.snp.trailing).offset(16)
        })
        lbName.font = UIFont.boldSystemFont(ofSize: 20)
        
        // lbEmail
        lbEmail.snp.makeConstraints({ make in
            make.top.equalTo(lbName.snp.bottom).offset(3)
            make.leading.equalTo(imgAvatar.snp.trailing).offset(16)
        })
        
    }
    
}
