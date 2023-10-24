//
//  HomeViewController.swift
//  SEA
//
//  Created by solinx on 24/10/2023.
//

import UIKit

protocol HomeDetailDelegate: AnyObject {
    func navigateToDetail()
}

class HomeViewController: UIViewController, HomeDetailDelegate {

    @IBOutlet weak var tableViewHome: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .white
        appearance.shadowColor = .clear

        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        navigationItem.titleView = CustomTitle(frame: .zero)
        registerTableCells()
    }
    
    func registerTableCells() {
        
        tableViewHome.dataSource = self
        tableViewHome.delegate = self
        tableViewHome.registerForCells(cells: [
            HomeSliderTableViewCell.self,
            SeaCategoryTableViewCell.self,
            UpComingTableViewCell.self])
    }


    func navigateToDetail() {
        let vc = DetailViewController()
        vc.modalPresentationStyle = .overFullScreen //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeReuseCell(type: HomeSliderTableViewCell.self, indexPath: indexPath)
            cell.delegate = self
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeReuseCell(type: SeaCategoryTableViewCell.self, indexPath: indexPath)
            cell.delegate = self
            return cell
        } else {
            let cell = tableView.dequeReuseCell(type: UpComingTableViewCell.self, indexPath: indexPath)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}
