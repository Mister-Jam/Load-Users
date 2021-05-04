//
//  VC.swift
//  ChallengeV1
//
//  Created by King Bileygr on 5/2/21.
//

import UIKit
import MapKit

class DetailsViewController: UIViewController {
    
    //MARK:- Local Variables
    var detailView: ViewsObjects
    var cellIndex: Int?
    var locationManager = CLLocationManager()
    var latitude: Double?
    var longitude: Double?
    lazy var pinTitle = ""
    var listData = [UsersModel]()
    
    //MARK:- Register and Assign Collection View Delegate
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        detailView.listCollectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: ListCollectionViewCell.reuseIdentifier)
        detailView.listCollectionView.delegate = self
        detailView.listCollectionView.dataSource = self
        
    }
    
    init(detailView: ViewsObjects = ViewsObjects()) {
        self.detailView = detailView
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Setup Subviews and Request Location Permissions
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        dataDistrubution()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        configureViews()
    }
    
    //MARK:- Parse data to the right objects
    func dataDistrubution() {
        guard let indexPath = cellIndex else { return }
        let data = listData[indexPath]
        let lat = Double(data.address.geo.lat)
        let lng = Double(data.address.geo.lng)
        if lat != nil && lng != nil {
            latitude = lat
            longitude = lng
        }
        pinTitle = "\(data.address.street ) \n\(data.address.suite )"
        setupAttributedText()
    }
    
    //MARK:- Setup Attributeed Text for Labels
    func setupAttributedText() {
        guard let indexPath = cellIndex else { return }
        let item = listData[indexPath]
        
        let text = ["Company: ", "Phone: ", "Email: "]
        let labels = [detailView.companyLabel, detailView.phoneLabel, detailView.emailLabel]
        let details = [item.company.name, item.phone, item.email ]
        for i in 0..<labels.count {
            let attributedString = NSMutableAttributedString(string: text[i], attributes: [.font: UIFont(name:  Constants.titleBold, size: 16)!, .foregroundColor: UIColor.black] )
            
            attributedString.append(NSAttributedString(string: details[i], attributes: [.font: UIFont(name:  Constants.bodyNormal, size: 16)!, .foregroundColor: UIColor.darkGray]))
            
            labels[i].attributedText = attributedString
        }
    }
    //MARK:- Setup Mapview and Marker
    let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.showsUserLocation = true
        return mapView
    }()
    
    lazy var marker: MKPointAnnotation = {
        let marker = MKPointAnnotation()
        marker.title = pinTitle
        marker.coordinate = CLLocationCoordinate2D(latitude: latitude ?? 0, longitude: longitude ?? 0)
        return marker
    }()
    //MARK:- Back Button Action
    @objc func tappedBackButton() {
        dismiss(animated: true, completion: nil)
    }
}
