//
//  ViewController.swift
//  Film App
//
//  Created by Himash Nadeeshan on 4/19/20.
//  Copyright © 2020 Himash Nadeeshan. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage
import SVProgressHUD
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    var films = [FilmDataModel]()
    var refreshControl : UIRefreshControl!
    
    override var prefersStatusBarHidden: Bool {
      return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        SendRequest().getData { response in
            if var response = response {

                if response.isEmpty{
                    
                    let alert = UIAlertController(title: "Unable to join the netwok", message: "Please check your internet connection and try again", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                }else{
                    
                    self.films = response
                    let objarray : Observable<[FilmDataModel]> = Observable.just(self.films)
                    objarray.bind(to: self.tableview.rx.items(cellIdentifier: "cell")){_,film,cell in
                        if let cellTo = cell as? TableViewCell{
                            cellTo.title.text = film.title
                            let url = URL(string: film.poster)
                            cellTo.poster.sd_setImage(with: url, placeholderImage: UIImage(named: "vmm.jpg"));
                            cellTo.year.text = film.year
                            cellTo.type.text = film.type

                        }
                    }
                }
            }
        }
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "refresh")
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableview.addSubview(refreshControl)
        
    }
    
    @objc func refresh(_ sender: Any) {
        tableview.reloadData()
        refreshControl.endRefreshing()
    }

    @IBAction func logout(_ sender: Any) {
        
        performSegue(withIdentifier: "gotologin", sender: nil)
        
    }
    
}

