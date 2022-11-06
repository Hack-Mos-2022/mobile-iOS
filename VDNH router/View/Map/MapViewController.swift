//
//  MapViewController.swift
//  VDNH-router
//
//  Created by Anatoliy Podkladov on 05.11.2022.
//

import SwiftUI
import MapboxMaps

final class MapViewController: UIViewController {
    
   var mapView: MapView!
    
   override public func viewDidLoad() {
       super.viewDidLoad()
       
       setupMap()
       setupLocation()
       setCurrentLocation()
       setupPins()
   }
    
    private func setupMap() {
        
        let cameraOptions = CameraOptions(
            center: CLLocationCoordinate2D(
                latitude: 55.830416,
                longitude: 37.630059
            ),
            zoom: 14,
            bearing: -17.6 , pitch: 45
        )
        
        let myResourceOptions = ResourceOptions(
            accessToken: "pk.eyJ1IjoiYW5hdG9saXktb2xvbG8iLCJhIjoiY2p0OTA2YmtsMGQ5NjQ1bXJhdTIybzR6aSJ9.2XNGR0tsOpFC7oWwQRzgVw"
        )
        
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions, cameraOptions: cameraOptions, styleURI: .streets) //.satellite)
        
        mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)
        mapView.ornaments.compassView.isHidden = true
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(mapView)
    }
    
    private func setupLocation() {
        mapView.location.delegate = self
        mapView.location.options.activityType = .fitness // .other // FIXME:
        mapView.location.options.puckType = .puck2D()
        mapView.location.locationProvider.startUpdatingLocation()
    }
    
    func setCurrentLocation() {
        mapView.mapboxMap.onNext(event: .mapLoaded) { [self]_ in
            guard let latestLocation = mapView.location.latestLocation else { return }
            // self.locationUpdate(newLocation: latestLocation)
            let vdnhLocation = Location(with: CLLocation(latitude: 55.830416, longitude: 37.630059))
            self.locationUpdate(newLocation: vdnhLocation)
        }
    }
    
    private func setupPins() {
        
        var pointAnnotation = PointAnnotation(
            coordinate: CLLocationCoordinate2DMake(55.83141612000010, 37.634059457794)
        )
        pointAnnotation.image = .init(image: UIImage(named: "iconRedPin")!, name: "iconRedPin")
        pointAnnotation.iconAnchor = .bottom

        let pointAnnotationManager = mapView.annotations.makePointAnnotationManager()
        pointAnnotationManager.annotations = [pointAnnotation]
        pointAnnotationManager.delegate = self
    }
    
}

extension MapViewController: AnnotationInteractionDelegate {
    
    public func annotationManager(_ manager: AnnotationManager, didDetectTappedAnnotations annotations: [Annotation]) {
        print("Annotations tapped: \(annotations)")
        
        self.addViewAnnotation(at: CLLocationCoordinate2DMake(55.83141612000010, 37.634059457794))
    }

    // 1. Auxiliary function to create a sample view.
    private func createSampleView(withText text: String) -> UIView {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .white
        label.textAlignment = .center
        return label
    }
    
    enum Place: String {
        case museum = "museumBigPin"
        case pavilion = "pavilonsBigPin"
        case restaurant = "restaurantBigPin"
    }
    
    private func createBigPinWith(place: Place) -> UIView {
        let view = UIImageView(image: UIImage(named: place.rawValue))
        // let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: <#T##Selector?#>)
        // view.addGestureRecognizer(tapGestureRecognizer)
        return view
    }
    
    private func addViewAnnotation(at coordinate: CLLocationCoordinate2D) {
        // 2. Setting up the annotation options
        let options = ViewAnnotationOptions(
            geometry: Point(coordinate),
            // width: 100,
            // height: 40,
            allowOverlap: false,
            visible: true,
            anchor: .center,
            offsetY: 40
        )
        
        // 3. Creating and adding the sample view to the mapView
        // let sampleView = createSampleView(withText: "Hello world!")
        let sampleView = createBigPinWith(place: .pavilion)
        try? mapView.viewAnnotations.add(sampleView, options: options)
    }
}

extension MapViewController: LocationPermissionsDelegate, LocationConsumer {
    
    func locationUpdate(newLocation: Location) {
        mapView.camera.fly(
            to: CameraOptions(center: newLocation.coordinate, zoom: 14.0),
            duration: 5.0
        )
    }
    
}

struct MapBoxMapView_Previews: PreviewProvider {
    static var previews: some View {
        MapBoxMapView()
            .ignoresSafeArea()
    }
}
