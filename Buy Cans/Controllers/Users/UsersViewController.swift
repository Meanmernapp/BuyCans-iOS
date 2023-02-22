//
//  UsersViewController.swift
//  Buy Cans
//
//  Created by HaiDeR AwAn on 22/02/2023.
//

import UIKit

class UsersViewController: UIViewController {
    
    
    //MARK: - Variables
    
    var data : [UserModel]?
    let refreshControl = UIRefreshControl()
    
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        self.tableView.addSubview(refreshControl)
        self.getCans()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        refreshControl.endRefreshing()
        self.getCans()
    }
    
    //MARK: - Functions
    
    func getCans() {
        if Network.isAvailable {
            self.activityInd.startAnimating()
            self.activityInd.isHidden = false
            Networkhandler.shared.ApiUserCall { userData,error in
                self.activityInd.stopAnimating()
                self.activityInd.isHidden = true
                if error == nil {
                    self.data = userData
                    Global.shared.globalUserData = userData
                    self.tableView.reloadData()
                }
                else {
                    AppUtility.showErrorMessage(message: "Server Error Pull to refresh")
                }
            }
        }
        else {
            AppUtility.showErrorMessage(message: "Internet Connection Failed")
        }
    }
    
}

extension UsersViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(UsersTableViewCell.self, indexPath: indexPath)
        cell.config(userData:self.data?[indexPath.row])

        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
