//
//  MatchesCell.swift
//  FutStats
//
//  Created by Vitaliy Halai on 2.03.23.
//

import UIKit
import Lottie
class MatchesCell: UITableViewCell {

    
    @IBOutlet weak var homeTeamGoals: UILabel!
    @IBOutlet weak var homeTeamName: UILabel!
    @IBOutlet weak var homeTeamLogo: UIImageView!
    
    @IBOutlet weak var awayTeamGoals: UILabel!
    @IBOutlet weak var awayTeamLogo: UIImageView!
    @IBOutlet weak var awayTeamName: UILabel!
    
    private var animationView = LottieAnimationView(name: "progressBar")
    
    override func awakeFromNib() {
        super.awakeFromNib()
   // setupAnimation()
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
     func setupAnimation(){
        animationView.contentMode = .scaleAspectFit
        animationView.frame.size = CGSize(width: 100, height: 60)
        animationView.center = self.center
         animationView.center.y = 50
        animationView.loopMode = .autoReverse
        animationView.play()
        //print("centerX  \(cell.center.x), centerY \(cell.center.y)")
        self.addSubview(animationView)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        animationView.play()
    }
}
