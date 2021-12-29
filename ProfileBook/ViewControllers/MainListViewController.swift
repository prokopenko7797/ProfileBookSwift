//
//  MainListViewController.swift
//  ProfileBook
//
//  Created by User on 27.12.2021.
//

import Foundation
import UIKit

class MainListViewController: UIViewController
{
    @IBOutlet weak var tableView: UITableView!
    
    var profiles = ProfileService.shared.getUserProfiles(UserDefaults.standard.integer(forKey: "userId"))
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: UIImage(named: "ic_settings"), style: .done, target: self, action: nil),
            UIBarButtonItem(image: UIImage(named: "ic_exit_to_app"), style: .done, target: self, action: #selector(logOut))
        ]
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    @IBAction func logOut()
    {
        UserService.shared.logOut()
        
        let loginVC: LoginNavigationController = storyboard?.instantiateViewController(withIdentifier: "LoginNavigationController") as! LoginNavigationController
        
        self.view.window?.rootViewController = loginVC
        self.view.window?.makeKeyAndVisible()
    }
    
    
}


extension MainListViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let profile = profiles[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ProfileCell
        
        cell.setProfile(profile: profile)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
}
