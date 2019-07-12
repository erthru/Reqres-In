//
//  PeopleController.swift
//  Reqres In
//
//  Created by Suprianto Djamalu on 12/07/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import UIKit
import RxSwift
import SnapKit

class PeopleController: BaseController {
    
    let tablePeople = UITableView()
    let idcLoading = UIActivityIndicatorView(style: .gray)
    let viewIdcLoadingNext = UIView()
    let idcLoadingNext = UIActivityIndicatorView(style: .gray)
    let refreshControl = UIRefreshControl()
    
    let viewModel = ListsPeopleViewModel(api: Api())
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.get()
    }
    
    override func dataBinding(){
        
        viewModel.didLoading.subscribe({
            
            print($0.element!)
            self.idcLoading.isHidden = !$0.element!
            
        }).disposed(by: disposeBag)
        
        viewModel.didLoadingNext.subscribe({
            
            print($0.element!)
            self.viewIdcLoadingNext.isHidden = !$0.element!
            
        }).disposed(by: disposeBag)
        
        viewModel.peoples.subscribe({
            
            print($0.element!)
            
            if $0.element!.count > 0 {
                self.tablePeople.isHidden = false
                self.tablePeople.reloadData()
            }else{
                self.tablePeople.isHidden = true
            }
            
        }).disposed(by: disposeBag)
        
    }
    
    @objc func refreshControlOnRefresh(){
        refreshControl.endRefreshing()
        viewModel.get()
    }
    
    override func setupUI(){
        
        // view
        view.backgroundColor = .white
        view.addSubview(tablePeople)
        view.addSubview(idcLoading)
        view.addSubview(viewIdcLoadingNext)
        
        // navigation
        navigationItem.title = "People"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // tablePeople
        tablePeople.snp.makeConstraints({ make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
        })
        tablePeople.register(PeopleCell.self, forCellReuseIdentifier: "people_cell")
        tablePeople.delegate = self
        tablePeople.dataSource = self
        tablePeople.refreshControl = refreshControl
        
        // idcLoading
        idcLoading.snp.makeConstraints({ make in
            make.centerX.equalTo(view.snp.centerX)
            make.centerY.equalTo(view.snp.centerY)
        })
        idcLoading.startAnimating()
        
        // viewIdcLoadingNext
        viewIdcLoadingNext.snp.makeConstraints({ make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
            make.centerX.equalTo(view.snp.centerX)
            make.height.equalTo(37)
            make.width.equalTo(37)
        })
        viewIdcLoadingNext.backgroundColor = .white
        viewIdcLoadingNext.layer.masksToBounds = true
        viewIdcLoadingNext.layer.cornerRadius = 37 / 2
        viewIdcLoadingNext.addSubview(idcLoadingNext)
        
        // idcLoadingNext
        idcLoadingNext.snp.makeConstraints({ make in
            make.centerX.equalTo(viewIdcLoadingNext.snp.centerX)
            make.centerY.equalTo(viewIdcLoadingNext.snp.centerY)
        })
        idcLoadingNext.startAnimating()
        
        // refreshControll
        refreshControl.addTarget(self, action: #selector(refreshControlOnRefresh), for: .valueChanged)
        
    }

}

extension PeopleController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.peoples.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "people_cell") as! PeopleCell
        
        cell.build(people: viewModel.peoples.value[indexPath.row])
        
        return cell
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            print("fetch next row")
            viewModel.next()
        }
    }
}
