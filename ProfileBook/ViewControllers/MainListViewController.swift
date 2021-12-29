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
        
        NotificationCenter.default.addObserver(self, selector: #selector(onGetNotification(_:)), name: Notification.Name("save"), object: nil)
    }
    
    @objc func onGetNotification(_ notification: Notification)
    {
        profiles = ProfileService.shared.getUserProfiles(UserDefaults.standard.integer(forKey: "userId"))
        tableView.reloadData()
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
        
        cell.imageButton.tag = indexPath.row
        
        cell.imageButton.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        
        return cell
    }
    
    @objc func buttonAction(sender: UIButton) {
        let newImageView = UIImageView(image: sender.backgroundImage(for: .normal))
        newImageView.frame = UIScreen.main.bounds
        newImageView.backgroundColor = .black
        newImageView.contentMode = .scaleAspectFit
        newImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissFullscreenImage(sender:)))
        newImageView.addGestureRecognizer(tap)
        self.view.addSubview(newImageView)
        self.navigationController?.isNavigationBarHidden = true
        self.tabBarController?.tabBar.isHidden = true
    }

    @objc func dismissFullscreenImage(sender: UITapGestureRecognizer) {
        self.navigationController?.isNavigationBarHidden = false
        self.tabBarController?.tabBar.isHidden = false
        sender.view?.removeFromSuperview()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let addEditVC = self.storyboard?.instantiateViewController(withIdentifier: "AddEditProfileViewController") as! AddEditProfileViewController
        
        let profile = profiles[indexPath.row]
        
        addEditVC.profile = profile
        addEditVC.modalPresentationStyle = .fullScreen
        
        self.show(addEditVC, sender: nil)
        
    }
    
}
