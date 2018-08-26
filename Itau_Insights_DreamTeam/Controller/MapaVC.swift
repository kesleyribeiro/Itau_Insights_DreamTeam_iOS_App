//
//  MapaVC.swift
//  Itau_Insights_DreamTeam
//
//  Created by Kesley Ribeiro on 26/08/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit
import MapKit

class MapaVC: UIViewController {

    // MARK: - IBOutlet
 
    @IBOutlet weak var mapView: MKMapView!
 
    // MARK: - Properties
    var localizacoes: [Localizacao] = []
    let radiusRegiao: CLLocationDistance = 1000

    // MARK: - View life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Define localização inicial na Vila Olímpia, São Paulo
        let locInicial = CLLocation(latitude: -23.5973663, longitude: -46.6875778)
        centerMapOnLocation(location: locInicial)
        
        mapView.delegate = self
        mapView.register(LocalizacaoView.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
        
        carregarDadosIniciais()
        
        mapView.addAnnotations(localizacoes)
        
        // Mostrar localização no mapa
        let loc = Localizacao(title: "Vila Olímpia, SP", locationName: "Vila Olímpia", discipline: "Sculpture", coordinate: CLLocationCoordinate2D(latitude: -23.5973663, longitude: -46.6875778))

        mapView.addAnnotation(loc)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkLocationAuthorizationStatus()
    }
    
    // MARK: - CLLocationManager
    
    let locationManager = CLLocationManager()
    
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedAlways {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestAlwaysAuthorization()
        }
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
          mapView.showsUserLocation = true
        } else {
          locationManager.requestWhenInUseAuthorization()
        }
    }

    // MARK: - Private function
    
    private func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, radiusRegiao, radiusRegiao)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func carregarDadosIniciais() {

        // 1
        guard let fileName = Bundle.main.path(forResource: "PublicArt", ofType: "json")
            else { return }
        let optionalData = try? Data(contentsOf: URL(fileURLWithPath: fileName))
        
        guard
            let data = optionalData,
            // 2
            let json = try? JSONSerialization.jsonObject(with: data),
            // 3
            let dictionary = json as? [String: Any],
            // 4
            let works = dictionary["data"] as? [[Any]]
            else { return }
        // 5
        let valid = works.compactMap { Localizacao(json: $0) }
        localizacoes.append(contentsOf: valid)
    }
}

// MARK: - MKMapViewDelegate

extension MapaVC: MKMapViewDelegate {

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView,
                 calloutAccessoryControlTapped control: UIControl) {
        
        let location = view.annotation as! Localizacao
        
        let launchOptions = [MKLaunchOptionsDirectionsModeKey:
            MKLaunchOptionsDirectionsModeDriving]

        location.mapItem().openInMaps(launchOptions: launchOptions)
    }
    
}


