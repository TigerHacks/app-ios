//
//  TigerTalksTableViewController.swift
//  TigerHacks-App
//
//  Created by Jonah Zukosky on 3/9/18.
//  Copyright © 2018 Zukosky, Jonah. All rights reserved.
//

import UIKit

class ResourcesTableViewController: UITableViewController {

    var resources = [Resource]()
    var tigerTalks = [Resource]()
    var snippets = [YoutubeSnippet]()
    var prizes = [Prize]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initial Setup

        Model.sharedInstance.fakeAPICall()
        loadResources()

        // Refresh Control

        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(refresh(_:)), for: UIControl.Event.valueChanged)
        if let refreshControl = refreshControl { tableView.addSubview(refreshControl) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

// MARK: - Load Resources

    func loadResources() {

        Model.sharedInstance.youtubeLoad(dispatchQueueForHandler: DispatchQueue.main) {(snippets, errorString) in
            if let errorString = errorString {
                print("Error: \(errorString)")
            } else if let snippets = snippets {
                self.snippets = snippets
                var tempTigerTalks = [Resource]()
                for snippet in snippets {
                    let tigerTalk = Resource(url: snippet.resourceId.videoId, title: snippet.title, description: snippet.description)
                    tempTigerTalks.append(tigerTalk)
                }
                self.tigerTalks = tempTigerTalks
                self.tableView.reloadSections(IndexSet(integersIn: 0...0), with: UITableView.RowAnimation.automatic)
            }
        }
        
        self.resources = Model.sharedInstance.resources!
        self.tableView.reloadSections(IndexSet(integersIn: 1...1), with: UITableView.RowAnimation.automatic)
    }

    @objc func refresh(_ sender: Any) {
        Model.sharedInstance.fakeAPICall()
        let when = DispatchTime.now() + 0.7
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.loadResources()
            self.refreshControl?.endRefreshing()
            self.tableView.reloadData()
        }
    }

// MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "TigerTalks"
        } else {
            return "Other Resources"
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tigerTalks.count
        } else {
            return resources.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "talkCell", for: indexPath) as! ResourcesTableViewCell

        if indexPath.section == 0 {
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = tigerTalks[indexPath.row].title
        } else {
            cell.textLabel?.numberOfLines = 0
            cell.textLabel?.text = resources[indexPath.row].title
        }
        return cell
    }

// MARK: - Segues
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            performSegue(withIdentifier: "tigerTalkSegue", sender: self)
        } else {
            if resources[indexPath.row].title == "Instagram" {
                if let url = URL(string: "instagram://user?username=tigerhacks") {
                    if UIApplication.shared.canOpenURL(url) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url)
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    } else {
                        performSegue(withIdentifier: "resourceSegue", sender: self)
                    }
                }
            } else if resources[indexPath.row].title == "Twitter" {
                if let url = URL(string: "twitter://user?id=1898715698") {
                    if UIApplication.shared.canOpenURL(url) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url)
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    } else {
                        performSegue(withIdentifier: "resourceSegue", sender: self)
                    }
                }
            } else if resources[indexPath.row].title == "Facebook" {
                if let url = URL(string: "fb://profile/227243744100144") {
                    if UIApplication.shared.canOpenURL(url) {
                        if #available(iOS 10.0, *) {
                            UIApplication.shared.open(url)
                        } else {
                            UIApplication.shared.openURL(url)
                        }
                    } else {
                        performSegue(withIdentifier: "resourceSegue", sender: self)
                    }
                }
            } else {
               performSegue(withIdentifier: "resourceSegue", sender: self)
            }
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tigerTalkSegue" {
            let destination = segue.destination as! TigerTalksDetailViewController
            destination.navigationItem.title = tigerTalks[tableView.indexPathForSelectedRow?.row ?? 0].title
            destination.descriptionText = tigerTalks[tableView.indexPathForSelectedRow?.row ?? 0].description
            destination.videoCode = tigerTalks[tableView.indexPathForSelectedRow?.row ?? 0].url
        } else {
            let destination = segue.destination as! ResourceDetailViewController
            destination.urlString = resources[tableView.indexPathForSelectedRow?.row ?? 0].url
            destination.navigationItem.title = resources[tableView.indexPathForSelectedRow?.row ?? 0].title
        }
    }
}
