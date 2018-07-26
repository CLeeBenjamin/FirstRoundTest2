//
//  MapViewController.swift
//  FirstRoundTest
//
//  Created by Caston  Boyd on 7/10/18.
//  Copyright © 2018 Caston  Boyd. All rights reserved.
//

import UIKit
import Pulley
import MapKit
import Firebase

class MapViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var homeSearchBar: DesignableSearchBar!
    
    var finalArray = [Restaurant]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        FirebaseApp.configure()
       homeSearchBar.delegate = self
       OverviewModelController.sharedController.fetchAllData()
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }

  
    
    
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
//     guard let userSearch = searchBar.text else { return }
        
     print(OverviewModelController.sharedController.restaurantList.count)
        
        
        self.homeSearchBar.resignFirstResponder()
        
        DispatchQueue.main.async {
          
            self.homeSearchBar.text = ""
        
        }
        
        
    }
    
//    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//        pulleyViewController?.setDrawerPosition(position: .partiallyRevealed, animated: true)
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { (_) in
//
////            guard let userSearch = searchBar.text else { return }
//            self.homeSearchBar.becomeFirstResponder()
//
//
//
//        }
//
//    }
    
    
}



extension MapViewController: PulleyPrimaryContentControllerDelegate {
    
    func makeUIAdjustmentsForFullscreen(progress: CGFloat, bottomSafeArea: CGFloat)
    {
        guard let drawer = self.pulleyViewController, drawer.currentDisplayMode == .bottomDrawer else { return }
    
    }
}
