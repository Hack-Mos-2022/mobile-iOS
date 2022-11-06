//
//  MapBoxMapView.swift
//  VDNH-router
//
//  Created by Anatoliy Podkladov on 05.11.2022.
//

import SwiftUI

struct MapBoxMapView: UIViewControllerRepresentable {
     
    func makeUIViewController(context: Context) -> MapViewController {        
           return MapViewController()
       }
      
    func updateUIViewController(_ uiViewController: MapViewController, context: Context) {
    }
}
