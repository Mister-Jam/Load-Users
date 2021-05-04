//
//  CollectionViewCell.swift
//  ChallengeV1
//
//  Created by King Bileygr on 5/2/21.
//

import UIKit

//MARK:- CUSTOM COLLECTION VIEW CELL
class ListCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: ListCollectionViewCell.self)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK:- Objects
    let containerView:  UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "icon")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.nameB, size: 20)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Constants.dsscriptionNormal, size: 14)
        label.minimumScaleFactor = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 0
        label.textColor = .darkGray
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        stack.axis = .vertical
        stack.layoutMargins = .init(top: 15, left: 10, bottom: 0, right: 10)
        stack.isLayoutMarginsRelativeArrangement = true
        stack.distribution = .fillProportionally
        stack.contentMode = .scaleAspectFit
        stack.clipsToBounds = true
        return stack
    }()
    
    //MARK:- Auto-Layout and View Setup
    func setupSubViews() {
        addSubview(containerView)
        [iconImage, stackView].forEach {
            containerView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        constraints()
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            containerView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
            containerView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.88),
            containerView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            iconImage.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            iconImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            iconImage.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.4),
            iconImage.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.3),
            
            stackView.topAnchor.constraint(equalTo: containerView.layoutMarginsGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: containerView.layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: iconImage.leadingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
        ])
    }
    
}
