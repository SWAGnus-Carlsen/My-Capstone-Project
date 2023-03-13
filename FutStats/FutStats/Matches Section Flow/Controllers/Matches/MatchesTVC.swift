//
//  MatchesTVC.swift
//  FutStats
//
//  Created by Vitaliy Halai on 6.02.23.
//

import Lottie
import SwiftyJSON
import UIKit

final class MatchesTVC: UITableViewController {
    
    private enum matchStatus: String {
        case SCHEDULED
        case TIMED
        case IN_PLAY
        case FINISHED
        case PAUSED
        
        // not really useful but still...
        
        case SUSPENDED
        case POSTPONED
        case CANCELLED
        case AWARDED
    }
    
    var matches = [Match]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillTable()
      
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)
        navigationItem.rightBarButtonItem = editButtonItem
    }
    
    @objc func didPullToRefresh() {
        // re-fetch data
        fillTable()

    }
        
    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return matches.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MatchesCell
        let currMatch = matches[indexPath.row]
        cell.awayTeamName.text = currMatch.awayTeam?.name
        cell.homeTeamName.text = currMatch.homeTeam?.name
        
        cell.homeTeamGoals.text = currMatch.score?.fullTime?.home?.description
        cell.awayTeamGoals.text = currMatch.score?.fullTime?.away?.description
        
        APIManager.shared.fetchLogos(URLString: currMatch.homeTeam?.crest ?? "", for: cell.homeTeamLogo)
        APIManager.shared.fetchLogos(URLString: currMatch.awayTeam?.crest ?? "", for: cell.awayTeamLogo)
        if currMatch.status == matchStatus.IN_PLAY.rawValue{
            cell.setupAnimation()
        } else {
            cell.animationView.isHidden = true
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let standingsVC = storyboard.instantiateViewController(withIdentifier: "StandingsTVC") as? StandingsTVC else { return }
        guard let passedString = matches[indexPath.row].competition?.code else { return }
        print(passedString)
        standingsVC.league = passedString
        navigationController?.pushViewController(standingsVC, animated: true)
    }
//     // Override to support conditional editing of the table view.
//     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//         // Return false if you do not want the specified item to be editable.
//         return true
//     }
//

    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             // Delete the row from the data source
             tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
             // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
     }
     */

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {}
    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
     // MARK: - Navigation
//
//     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         if segue.destination is StandingsTVC {
//
//         }
//         // Get the new view controller using segue.destination.
//         // Pass the selected object to the new view controller.
//     }
     
    
    private func fillTable() {
        
        APIManager.shared.fetchMatches(from: ApiStringURLs.matchesForConcreteDate(date: "2023-03-12")) { [weak self] fetchedData in
            self?.matches = fetchedData
            DispatchQueue.main.async {
                self?.tableView.refreshControl?.endRefreshing()
                self?.tableView.reloadData()
            }
        }
    }
}
