//
//  ViewController.swift
//  ChallengeV1
//
//  Created by King Bileygr on 5/2/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    //MARK:- Local Variables
    var listData = [UsersModel]()
    var spinner = SpinnerViewController()
    
    //MARK:- Create view instance
    var homeView: ViewsObjects
    
    //MARK:- Register, assign collectionview datasource and delegates
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(homeView.listCollectionView)
        homeView.listCollectionView.dataSource = self
        homeView.listCollectionView.delegate = self
        homeView.listCollectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.reuseIdentifier)
        
        //MARK:- Call URL request
        spinner.start(container: self)
        LoadUsersManager.shared.getUsersData { [weak self] result in
            DispatchQueue.main.async {
                self?.listData.append(contentsOf: result)
                self?.homeView.listCollectionView.reloadData()
                self?.spinner.stop()
            }
            
        } failure: { error in
            print(error.debugDescription)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupSubView()
    }
    
    init(homeView: ViewsObjects = ViewsObjects()) {
        self.homeView = homeView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


