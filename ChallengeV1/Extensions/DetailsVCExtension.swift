//
//  DetailsVCExtension.swift
//  ChallengeV1
//
//  Created by King Bileygr on 5/3/21.
//

import Foundation
import MapKit

extension DetailsViewController: CLLocationManagerDelegate {
    
    //MARK:- Location Manager Delegate
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let region = MKCoordinateRegion.init(center: marker.coordinate, latitudinalMeters: CLLocationDistance(Constants.regionMeters), longitudinalMeters: CLLocationDistance(Constants.regionMeters))
        mapView.setRegion(region, animated: true)
        mapView.setCenter(marker.coordinate, animated: true)
    }
}

extension DetailsViewController {
   //MARK: Auto Layout and Constraints
    
    func configureViews() {
        
        [detailView.containerView, mapView, detailView.backButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        mapView.addAnnotation(marker)
        detailView.backButton.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        
        constraints()
        setupContainerViews()
    }
    
    func constraints() {
        NSLayoutConstraint.activate([
            mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mapView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45),
            mapView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            mapView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
            
            detailView.containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailView.containerView.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            detailView.containerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            detailView.containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            detailView.backButton.topAnchor.constraint(equalTo: detailView.containerView.bottomAnchor, constant: 40),
            detailView.backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            detailView.backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.35),
            detailView.backButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func setupContainerViews() {
        [detailView.stackViewContainer, detailView.listCollectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            detailView.containerView.addSubview($0)
        }
        detailView.stackViewContainer.addSubview(detailView.stackView)
        detailView.stackView.translatesAutoresizingMaskIntoConstraints = false
        containerConstraints()
    }
    
    func containerConstraints() {
        NSLayoutConstraint.activate([
                                        detailView.listCollectionView.topAnchor.constraint(equalTo: detailView.containerView.topAnchor),
                                        detailView.listCollectionView.widthAnchor.constraint(equalTo: detailView.containerView.widthAnchor, multiplier: 1.0),
                                        detailView.listCollectionView.heightAnchor.constraint(equalTo: detailView.containerView.heightAnchor, multiplier: 0.5),
                                        detailView.stackViewContainer.topAnchor.constraint(equalTo: detailView.listCollectionView.bottomAnchor, constant: 0.5),
                                    
                                        detailView.stackViewContainer.widthAnchor.constraint(equalTo: detailView.containerView.widthAnchor, multiplier: 1),
                                        detailView.stackViewContainer.bottomAnchor.constraint(equalTo: detailView.containerView.bottomAnchor),
                                        detailView.stackView.topAnchor.constraint(equalTo: detailView.stackViewContainer.topAnchor, constant: 25),
                                        detailView.stackView.widthAnchor.constraint(equalTo: detailView.stackViewContainer.widthAnchor, multiplier: 1),])
    }
}
//MARK:- Collection View Layout Method
extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
//MARK:- Controllers Collection View and Delegate Methods
extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionViewCell.reuseIdentifier, for: indexPath) as! ListCollectionViewCell
        let data = listData[indexPath.row + cellIndex!]
        cell.nameLabel.text = data.name
        cell.descriptionLabel.text = "\(data.address.street + " " + (data.address.suite))\n\(data.address.zipcode + " " + data.address.city)"
        cell.backgroundColor = .white
        return cell
    }
}
