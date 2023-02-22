//
//  CansViewController.swift
//  Apple Photos
//
//  Created by Shoaib's Macbook Pro on 25/01/2022.
//

import UIKit

class CansViewController: UIViewController {
    
    //MARK: - Variables
    
    var data : [CansModel]?
    let refreshControl = UIRefreshControl()
    let url = "https://api.punkapi.com/v2/beers"
    var isLoadingList : Bool = false

    //MARK: - IBOutlets
    
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
        self.getCans()
    }
    
    
    //MARK: - Functions
    
    @objc func refresh(_ sender: AnyObject) {
        refreshControl.endRefreshing()
        Networkhandler.shared.numberOfList = 10
        self.getCans()
    }
    
    func getCans() {
        if Network.isAvailable {
            self.activityInd.startAnimating()
            self.activityInd.isHidden = false
            Networkhandler.shared.ApiBearCall(self.url) { cansData,error in
                self.isLoadingList = false
                self.activityInd.stopAnimating()
                self.activityInd.isHidden = true
                if error == nil {
                    self.data = cansData
                    Global.shared.globalCansData = cansData
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

extension CansViewController : UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.register(CansTableViewCell.self, indexPath: indexPath)
        cell.config(self.data?[indexPath.row])
        cell.selectionStyle = .none
        return cell
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //I choose that best way with scroll because in cellForRow is not proper way.
        if (((scrollView.contentOffset.y + scrollView.frame.size.height) > scrollView.contentSize.height) && !isLoadingList){
            self.isLoadingList = true
            Networkhandler.shared.numberOfList += 10
            self.getCans()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let cell:CansTableViewCell = tableView.cellForRow(at: indexPath)! as! CansTableViewCell
        Global.shared.backGroundColor = cell.customBackGroundColor.backgroundColor ?? .random()
        Global.shared.index = indexPath.row
        Global.shared.globalImage = cell.imgView.image
        self.performSegue(withIdentifier: "detail", sender: self)
    }
    
}


extension UITableView {
    
    func register<T: UITableViewCell>(_: T.Type, indexPath: IndexPath) -> T {
        self.register(UINib(nibName: String(describing: T.self), bundle: .main), forCellReuseIdentifier: String(describing: T.self))
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as! T
        return cell
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
