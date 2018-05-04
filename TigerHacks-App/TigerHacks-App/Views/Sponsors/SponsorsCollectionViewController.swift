//
//  SponsorsCollectionViewController.swift
//  TigerHacks-App
//
//  Created by Jonah Zukosky on 3/9/18.
//  Copyright © 2018 Zukosky, Jonah. All rights reserved.
//

import UIKit

private let reuseIdentifier = "sponsorCell"

class SponsorsCollectionViewController: UICollectionViewController {

    var sponsors = [Sponsor]()
    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initial Setup
        
        setUpNavBar()
        Model.sharedInstance.fakeAPICall()
        loadSponsors()
        
        // Collection View Setup
        
        let numberOfCells = CGFloat(2)
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            
            flowLayout.minimumInteritemSpacing = 2
            flowLayout.minimumLineSpacing = 2
            
            let horizontalSpacing = flowLayout.minimumInteritemSpacing
            let cellWidth = (view.frame.width - (numberOfCells-1)*horizontalSpacing)/numberOfCells
            flowLayout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        }
        
        // Refresh Control
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh(_:)), for: UIControlEvents.valueChanged)
        collectionView?.addSubview(refreshControl)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
// MARK: - Load Sponsors
    
    @objc func refresh(_ sender:Any) {
        Model.sharedInstance.fakeAPICall()
        let when = DispatchTime.now() + 0.7
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.loadSponsors()
            self.refreshControl.endRefreshing()
            self.collectionView?.reloadData()
        }
    }
    
    func loadSponsors() {
        sponsors = Model.sharedInstance.sponsors!
    }
    
//MARK: - Nav Bar Gradient
    
    func setUpNavBar() {
        Model.sharedInstance.setBarGradient(navigationBar: (navigationController?.navigationBar)!)
    }

// MARK: - Collection View

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sponsors.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SponsorCollectionViewCell
        
        cell.view.clipsToBounds = true
        cell.view.layer.cornerRadius = 20
        cell.view.layer.borderWidth = 0.5
        cell.view.layer.borderColor = UIColor.lightGray.cgColor
        
        if let image = sponsors[indexPath.row].image {
            cell.sponsorImage?.image = image
        }else {
            cell.sponsorImage?.image = UIImage(named:"noImage")
        }

        return cell
    }
    
//MARK: - Segues

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "sponsorSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! SponsorsDetailViewController
        let selectedItem = collectionView?.indexPathsForSelectedItems?.first
        
        if let row = selectedItem?.row {
            let sponsor = sponsors[row]
            
            if let image = sponsor.image {
                destination.image = image
            }else {
                destination.image = UIImage(named:"noImage")
            }
            
            destination.titleText = sponsor.name
            destination.locationText = sponsor.location
            destination.websiteText = sponsor.website
            destination.descriptionText = sponsor.description
            if let mentorList = sponsor.mentors {
                destination.mentorList = mentorList
            }
            
        }
    }
}
