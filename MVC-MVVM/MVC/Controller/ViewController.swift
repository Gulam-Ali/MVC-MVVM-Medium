//
//  ViewController.swift
//  MVC-MVVM
//
//  Created by Sachin Mittal on 12/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tblview: UITableView!
    
    private var viewmodel = PostVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblview.delegate = self
        tblview.dataSource = self
        tblview.tableFooterView = UIView()
        viewmodel.delegate = self
        viewmodel.fetchPosts()
    }


}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewmodel.postArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! PostCell
        cell.titleLbl.text = viewmodel.postArr[indexPath.row].title ?? ""
        cell.desc.text = viewmodel.postArr[indexPath.row].body ?? ""
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension ViewController : PostVMProtocol{
    func didGetError(error: String) {
        print(error)
    }
    
    func didGetPost() {
        self.tblview.reloadData()
    }
    
    
}



