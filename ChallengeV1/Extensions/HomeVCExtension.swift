//
//  HomeVCExtension.swift
//  ChallengeV1
//
//  Created by King Bileygr on 5/3/21.
//

import UIKit

extension HomeViewController {
   //MARK:- Autlo-Layout Constraints
    func setupSubView() {
        NSLayoutConstraint.activate([
                                        homeView.listCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.0),
                                        homeView.listCollectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.0)])
    }
}
//MARK:- Collection View Layout Methods
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (view.frame.width - (view.safeAreaInsets.left + view.safeAreaInsets.right) ), height: (view.frame.height - (view.safeAreaInsets.top + view.safeAreaInsets.bottom))/5 )
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        homeView.listCollectionView.collectionViewLayout.invalidateLayout()
    }
}

//MARK:- Collection View DataSource and Delegate Methods
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = homeView.listCollectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier, for: indexPath) as! ListCollectionViewCell
        let data = listData[indexPath.row]
        cell.nameLabel.text = data.name
        cell.descriptionLabel.text = "\(data.address.street + " " + (data.address.suite))\n\(data.address.zipcode + " " + data.address.city)"
        cell.backgroundColor = Constants.backgroundColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let viewController = DetailsViewController()
        viewController.cellIndex = indexPath.row
        viewController.listData = listData
        presentVC(controller: viewController)
    }
    
    func presentVC(controller: UIViewController) {
        let vc = controller
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .crossDissolve
        present(vc, animated: true, completion: {
            UIView.animate(withDuration: 1.5, delay: 0.3, options: .preferredFramesPerSecond30, animations: {
                controller.view.backgroundColor = .white
            }, completion: {_ in
                controller.view.backgroundColor = Constants.backgroundColor
            })
        })
    }
}

