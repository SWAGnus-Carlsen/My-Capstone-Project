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
    
    var animationView = LottieAnimationView(name: "progressBar2")
    var isHiddenn: Bool = true
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
        animationView.frame.size = CGSize(width: 50, height: 30)
        animationView.center = self.center
         animationView.center.y = 50
        animationView.loopMode = .autoReverse
        animationView.play()
         
         animationView.isHidden = false
        self.addSubview(animationView)
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        animationView.play()
    }
}
