//
//  MatchesCell.swift
//  FutStats
//
//  Created by Vitaliy Halai on 2.03.23.
//

import Lottie
import UIKit
class MatchesCell: UITableViewCell {
    @IBOutlet var homeTeamGoals: UILabel!
    @IBOutlet var homeTeamName: UILabel!
    @IBOutlet var homeTeamLogo: UIImageView!

    @IBOutlet var awayTeamGoals: UILabel!
    @IBOutlet var awayTeamLogo: UIImageView!
    @IBOutlet var awayTeamName: UILabel!

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

    func setupAnimation() {
        animationView.contentMode = .scaleAspectFit
        animationView.frame.size = CGSize(width: 50, height: 30)
        animationView.center = self.center
        animationView.center.y = 50
        //animationView.center.y = 90
        // animationView.center.x = 340
        animationView.loopMode = .autoReverse
        animationView.play()

        animationView.isHidden = false
        self.addSubview(animationView)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        for subview in homeTeamLogo.subviews {
            subview.removeFromSuperview()
        }
        for subview in awayTeamLogo.subviews {
            subview.removeFromSuperview()
        }
        
    }
}
