//
//  StandingsCell.swift
//  FutStats
//
//  Created by Vitaliy Halai on 12.03.23.
//

import UIKit

class StandingsCell: UITableViewCell {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var numOfWins: UILabel!
    @IBOutlet weak var numOfDraws: UILabel!
    @IBOutlet weak var numOfLoses: UILabel!
    @IBOutlet weak var goalsDifference: UILabel!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var position: UILabel!
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // setupAnimation()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    static func nib() -> UINib {
        UINib(nibName: "StandingsCell", bundle: nil)
    }

    static func identifier() -> String {
        "StandingsCell"
    }

    

    override func prepareForReuse() {
        super.prepareForReuse()
        for subview in logo.subviews {
            subview.removeFromSuperview()
        }
        
    }
}
