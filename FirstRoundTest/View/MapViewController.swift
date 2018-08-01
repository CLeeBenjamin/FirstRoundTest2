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
    
    
    //MARK: - Outlets
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var homeSearchBar: DesignableSearchBar!
    
    
    //MARK: - Singleton
    static let sharedMapViewController = MapViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirebaseApp.configure()
        homeSearchBar.delegate = self
        fetchAllData { (restaurant) in
            print(restaurant.count)
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    
    var restaurantList = [Restaurant]()
    
    var restaurantListModified = [String : [Restaurant]]()

    var tableViewNameArray = [String]() {
        
        didSet {
            DispatchQueue.main.async {
              DispatchQueue.main.async {
            NotificationCenter.default.post(name: MapViewController.RestaurantNotification.notificationSet, object: self)
            }
            }
        }
        
    }
    
    
    enum RestaurantNotification {
        static let notificationSet = Notification.Name("NotificationSet")
    }
    
    var ref: DatabaseReference?
    
    let restaurantGroup = DispatchGroup()
    
    
    func fetchAllData( completion: @escaping (_ call: [Restaurant]) -> Void) {
        
        self.ref = Database.database().reference()
        
        self.ref?.observe(.value, with: { (snap) in
            guard let topArray = snap.value as? [[String:Any]] else {print(":(") ; return }
            var restaurantArray = [Restaurant]()
            
            for dictionary in topArray {
                self.restaurantGroup.enter()
                guard let address = dictionary["Address"] as? String,
                    let city = dictionary["City"] as? String,
                    let inspectionDate = dictionary["Inspection Date"] as? String,
                    let name = dictionary["Name"] as? String,
                    let major = dictionary["Number of Occurrences (Critical Violations)"] as? Int,
                    let minor = dictionary["Number of Occurrences (Noncritical Violations)"] as? Int,
                    let violationTitle = dictionary["Violation Title"] as? String else { continue }
                print(2)
                //MARK: - creates restaurants from the list above
                let restaurant = Restaurant(address: address, city: city, inspectionDate: inspectionDate, name: name, major: major, minor: minor, violationTitle: violationTitle)
                
                print(3)
                //MARK: - Adds a restaurant to restaurant array instance
                restaurantArray.append(restaurant)
                
            }
            
            self.restaurantList = restaurantArray
            self.restaurantGroup.leave()
            
            
            completion(self.restaurantList)
            
            
            let dictionaryNew = Dictionary(grouping: self.restaurantList) { $0.name + " " + $0.address}
            
            
            
            self.restaurantListModified = dictionaryNew
            print(self.restaurantListModified.count)
        })
        
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        var filteredArray = [[Restaurant]]()
        
        guard let userSearch = searchBar.text?.uppercased() else { return }
        pulleyViewController?.setDrawerPosition(position: .partiallyRevealed, animated: true)
        
        var nameArray = [String]()
        
        for (key, value) in restaurantListModified {
            
            if value[0].name.hasPrefix(userSearch.uppercased()){
                filteredArray.append(value)
            }
            
            
        }
        
        for subarray in filteredArray {
            
            let nameArrayForTBView = subarray[0].name
            nameArray.append(nameArrayForTBView)
            
        }
        self.tableViewNameArray = nameArray
        print("\(tableViewNameArray.count)😋😋😋😋😋😋😋😋😋😋😋😋")
        print("this First")
        
    }
    
    
}




extension MapViewController: PulleyPrimaryContentControllerDelegate {
    
    func makeUIAdjustmentsForFullscreen(progress: CGFloat, bottomSafeArea: CGFloat)
    {
        guard let drawer = self.pulleyViewController, drawer.currentDisplayMode == .bottomDrawer else { return }
        
    }
}
