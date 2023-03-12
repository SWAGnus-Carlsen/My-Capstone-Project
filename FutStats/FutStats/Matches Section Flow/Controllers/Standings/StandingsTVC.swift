//
//  StandingsTVC.swift
//  FutStats
//
//  Created by Vitaliy Halai on 12.03.23.
//

import UIKit

class StandingsTVC: UITableViewController {
    
    var standings: [Standing] = []
    var standing: Standing?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillTable()
        
        //        for standing in standings {
        //            if standing.type == "TOTAL" {
        //                self.standing = standing
        //            }
        //        }
        //        tableView.reloadData()
        
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        // navigationItem.rightBarButtonItem = editButtonItem
    }
    
    
    @objc func didPullToRefresh() {
        // re-fetch data
        fillTable()
        
    }
    // MARK: - Table view data source
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (standings.first?.table.count) ?? 20
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? StandingsCell else {
            return UITableViewCell()
        }
        let currentTeam = standings.first?.table[indexPath.row]
        
        APIManager.shared.fetchLogos(URLString: currentTeam?.team.crest ?? "", for: cell.logo)
        cell.teamName.text = currentTeam?.team.name
        cell.numOfWins.text = currentTeam?.won.description
        cell.numOfDraws.text = currentTeam?.draw.description
        cell.numOfLoses.text = currentTeam?.lost.description
        cell.goalsDifference.text = currentTeam?.goalDifference.description
        cell.points.text = currentTeam?.points.description
        cell.frame.size = CGSize(width: view.frame.width, height: 40)
        return cell
    }
    
    
    private func fillTable() {
        
        APIManager.shared.fetchStandings(from: ApiStringURLs.standingsForConcreteLeague("PL")) { [weak self] fetchedData in
            self?.standings = fetchedData
            
            DispatchQueue.main.async {
                self?.tableView.refreshControl?.endRefreshing()
                self?.tableView.reloadData()
            }
        }
    }
    
    
}
