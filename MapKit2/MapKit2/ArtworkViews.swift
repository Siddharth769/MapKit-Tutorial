//
//  ArtworkViews.swift
//  MapKit2
//
//  Created by siddharth on 03/01/19.
//  Copyright © 2019 clarionTechnologies. All rights reserved.
//

import Foundation
import MapKit


// Class for colored glyphs and annotation markers
class ArtworkMarkerView: MKMarkerAnnotationView {
    
    
    override var annotation: MKAnnotation? {
        willSet {
 
            guard let artwork = newValue as? Artwork else { return }
            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
          
         
            
// Use this for user defined colored glyphs
            markerTintColor = artwork.markerTintColor
            glyphText = String(artwork.discipline.first!)
            
// use his for user defined image glyphs
//            if let imageName = artwork.imageName {
//                glyphImage = UIImage(named: imageName)
//            } else {
//                glyphImage = nil
//            }
        }
    }
}

// class for custom asssets images as annotation markers
class ArtworkView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            
            guard let artwork = newValue as? Artwork else {return}
            
            let detailLabel = UILabel()
            detailLabel.numberOfLines = 0
            detailLabel.font = detailLabel.font.withSize(12)
            detailLabel.text = artwork.subtitle
            detailCalloutAccessoryView = detailLabel

            canShowCallout = true
            calloutOffset = CGPoint(x: -5, y: 5)
//            rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                                    size: CGSize(width: 30, height: 30)))
            mapsButton.setBackgroundImage(UIImage(named: "Maps-icon"), for: UIControl.State())
            rightCalloutAccessoryView = mapsButton
            
            if let imageName = artwork.imageName {
                image = UIImage(named: imageName)
            } else {
                image = nil
            }
        }
    }
}


