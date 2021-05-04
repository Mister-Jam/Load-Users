//
//  HomeViews.swift
//  ChallengeV1
//
//  Created by King Bileygr on 5/3/21.
//

import UIKit

class ViewsObjects: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    //MARK:- Collection view for the screens
    let listCollectionView: UICollectionView = {
        let view = UIView()
        let collectionViewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = Constants.backgroundColor
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        return collectionView
    }()
    
    //MARK:- Buttons, labels and staxkviews
    let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.setTitle("Back", for: .normal)
        button.tintColor = .white
        button.contentHorizontalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    var phoneLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [emailLabel, phoneLabel, companyLabel])
        stack.axis = .vertical
        stack.backgroundColor = .white
        stack.layoutMargins = .init(top: 0, left: 35, bottom: 0, right: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.contentMode = .scaleAspectFit
        stack.clipsToBounds = true
        return stack
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    let stackViewContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
