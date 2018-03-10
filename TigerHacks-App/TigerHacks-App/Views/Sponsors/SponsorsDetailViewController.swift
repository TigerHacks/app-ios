//
//  SponsorsDetailViewController.swift
//  TigerHacks-App
//
//  Created by Jonah Zukosky on 3/9/18.
//  Copyright © 2018 Zukosky, Jonah. All rights reserved.
//

import UIKit

class SponsorsDetailViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var sponsorImage: UIImageView!
    @IBOutlet weak var sponsorTitle: UILabel!
    @IBOutlet weak var sponsorLocation: UILabel!
    @IBOutlet weak var sponsorWebsite: UILabel!
    @IBOutlet weak var sponsorDescription: UILabel!
    @IBOutlet weak var mentorTableView: UITableView!
    
    var image:UIImage?
    var titleText:String?
    var locationText:String?
    var websiteText:String?
    var descriptionText:String?
    var mentorList: [Mentor]?
    
    @IBOutlet weak var navItem: UINavigationItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sponsorImage.image = image
        //navItem.title = image?.description
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Table View Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let count = mentorList?.count {
            return count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mentorCell", for: indexPath) as! MentorTableViewCell
        
        
        if let mentor = mentorList?[indexPath.row] {
            cell.textLabel?.text = mentor.name
            cell.detailTextLabel?.text = mentor.skills?.first
        }
        
        return cell
    }

    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
