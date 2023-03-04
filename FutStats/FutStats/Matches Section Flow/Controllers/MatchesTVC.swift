//
//  MatchesTVC.swift
//  FutStats
//
//  Created by Vitaliy Halai on 6.02.23.
//

import UIKit
import SwiftyJSON
final class MatchesTVC: UITableViewController {
   

    
    var matches = [Match]()
    let url = "https://api.football-data.org/v4/matches/"
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        APIManager.shared.fetchMatches(from: url) { fetchedData in
            self.matches = fetchedData
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
   
        
        
        

    // MARK: - Table view data source

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

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
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
