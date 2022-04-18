//
//  ViewController.swift
//  WhereIsTheConvenienceStore
//
//  Created by 유준용 on 2022/04/14.
//

import UIKit
import CoreLocation
import RxCocoa
import RxSwift

class LocationInformationViewController: UIViewController {
    let disposeBag = DisposeBag()
    
    let locationManager = CLLocationManager()
    let mapView = MTMapView()
    let currentLocationButton = UIButton()
    let detailList = UITableView()
    let viewModel = LocationInformationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        locationManager.delegate = self
        
        bind(viewModel)
        attribute()
        layout()
    }
    
    private func bind(_ viewModel: LocationInformationViewModel){
        currentLocationButton.rx.tap.bind(to: viewModel.currentLocationButtonTapped).disposed(by: disposeBag)
        viewModel.setMapCenter.emit(to: )
    }
    private func attribute(){
        title = "내 주변 편의점 찾기"
        view.backgroundColor = .white
        mapView.currentLocationTrackingMode = .onWithoutHeadingWithoutMapMoving
        currentLocationButton.setImage(UIImage(systemName: "location.fill"), for: .normal)
        currentLocationButton.layer.cornerRadius = 28
    }
    
    private func layout(){
        [mapView, currentLocationButton, detailList].forEach{
            view.addSubview($0)
        }
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            
            currentLocationButton.bottomAnchor.constraint(equalTo: detailList.bottomAnchor, constant: -20),
            currentLocationButton.leadingAnchor.constraint(equalTo: detailList.leadingAnchor, constant: 20),
            currentLocationButton.widthAnchor.constraint(equalToConstant: 40),
            currentLocationButton.heightAnchor.constraint(equalToConstant: 40),
            
            detailList.topAnchor.constraint(equalTo: mapView.bottomAnchor),
            detailList.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailList.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailList.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension LocationInformationViewController: CLLocationManagerDelegate {
    //사용자의 위치 얻기, 승인...
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        // iOS 14+
        let status = manager.authorizationStatus
        switch status{
        case .authorizedAlways, .authorizedWhenInUse, .notDetermined:
            return
        default:
            viewModel.mapViewError.accept(MTMapViewError.locationAuthorizationDenied.errorDescription)
            return
        }
    }
}

extension LocationInformationViewController: MTMapViewDelegate {
    func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
        #if DEBUG
        let defaultLocation = MTMapPoint(geoCoord: MTMapPointGeo(latitude: 37.39, longitude: 127.110341))
        viewModel.currentLocation.accept(location)
        #else
        viewModel.currentLocation.accept(location)
        #endif
    }
    func mapView(_ mapView: MTMapView!, finishedMapMoveAnimation mapCenterPoint: MTMapPoint!) {
        viewModel.mapCenterPoint.accept(mapCenterPoint)
    }
    func mapView(_ mapView: MTMapView!, selectedPOIItem poiItem: MTMapPOIItem!) -> Bool {
        // POI : Pin표시된 Item
        viewModel.selectPOIItem.accept(poiItem)
        return false
    }
    func mapView(_ mapView: MTMapView!, failedUpdatingCurrentLocationWithError error: Error!) {
        viewModel.mapViewError.accept(error.localizedDescription)
    }
}
