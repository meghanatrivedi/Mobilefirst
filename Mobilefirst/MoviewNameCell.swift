//
//  MoviewNameCell.swift
//  Mobilefirst
//
//  Created by Meghna on 10/02/22.
//

import UIKit

class MoviewNameCell: UITableViewCell {
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imgMovies: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareUI()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
extension MoviewNameCell{
    func prepareUI(){
        backView.backgroundColor = .clear
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 10
    }
}
