//
//  ProfileIntroTableViewCell.swift
//  LIBROG
//
//  Created by gomin on 2022/08/01.
//

import UIKit

class ProfileIntroTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var introductionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setUpIntro(_ result: IntroModel) {
        let name = result.name
        let intro = result.introduction
        let profileURL = result.profileImgUrl!
        
        userNameLabel.text = name
        introductionLabel.text = intro
        if let url = URL(string: profileURL) {
            profileImageView.kf.setImage(with: url, placeholder: UIImage(named: "logo_green"))
        }
    }
}
