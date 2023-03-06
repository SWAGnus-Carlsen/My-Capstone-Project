//
//  MatchesCell.swift
//  FutStats
//
//  Created by Vitaliy Halai on 2.03.23.
//

import UIKit

class MatchesCell: UITableViewCell {

    
    @IBOutlet weak var homeTeamGoals: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    
    @IBOutlet weak var awayTeamGoals: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    static func nib() -> UINib {
        UINib(nibName: "MatchesCell", bundle: nil)
    }
    static func identifier() -> String {
        "MatchesCell"
    }
}
