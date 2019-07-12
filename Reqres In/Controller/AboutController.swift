//
//  AboutController.swift
//  Reqres In
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift

class AboutController: BaseController {

    private let scrollView = UIScrollView()
    private let lbDeveloper = UILabel()
    private let lbGithub = UILabel()
    private let lbName = UILabel()
    private let imgAvatar = UIImageView(image: UIImage(named: "img_placeholder"))
    private let refreshControl = UIRefreshControl()
    
    private let viewModel = GithubProfileViewModel(api: Api())
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.get()
    }
    
    @objc func refreshControllerOnRefresh(){
        refreshControl.endRefreshing()
        viewModel.get()
    }
    
    override func setupUI(){
        
        // view
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        // navigation
        navigationItem.title = "About"
        
        // scrollView
        scrollView.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        })
        scrollView.refreshControl = refreshControl
        scrollView.addSubview(lbDeveloper)
        scrollView.addSubview(lbGithub)
        scrollView.addSubview(lbName)
        scrollView.addSubview(imgAvatar)
        
        // imgAvatar
        imgAvatar.snp.makeConstraints({ make in
            make.top.equalTo(scrollView.snp.top).offset(66)
            make.centerX.equalTo(scrollView.snp.centerX)
            make.height.equalTo(120)
            make.width.equalTo(120)
        })
        imgAvatar.layer.masksToBounds = true
        imgAvatar.layer.cornerRadius = 120 / 2
        
        // lbDeveloper
        lbDeveloper.snp.makeConstraints({ make in
            make.top.equalTo(imgAvatar.snp.bottom).offset(20)
            make.centerX.equalTo(scrollView.snp.centerX)
        })
        lbDeveloper.text = "ERTHRU"

        // lbName
        lbName.snp.makeConstraints({ make in
            make.top.equalTo(lbDeveloper.snp.bottom).offset(4)
            make.centerX.equalTo(scrollView.snp.centerX)
        })
        lbName.text = "Loading fullname.."
        lbName.font = UIFont.boldSystemFont(ofSize: 30)
        
        // lbGithub
        lbGithub.snp.makeConstraints({ make in
            make.top.equalTo(lbName.snp.bottom).offset(4)
            make.centerX.equalTo(scrollView.snp.centerX)
        })
        lbGithub.text = "https://github.com/erthru"
        lbGithub.textColor = .orange
        
        // refreshControl
        refreshControl.addTarget(self, action: #selector(refreshControllerOnRefresh), for: .valueChanged)
    }

    override func dataBinding() {
        
        viewModel.user.subscribe({
            
            if $0.element! != nil{
                self.imgAvatar.kf.setImage(with: URL(string: $0.element!!.avatarUrl))
                self.lbName.text = $0.element!!.name
            }
            
        }).disposed(by: disposeBag)
        
    }
    
}
