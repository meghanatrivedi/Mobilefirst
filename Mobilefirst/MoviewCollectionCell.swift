//
//  MoviewCollectionCell.swift
//  Mobilefirst
//
//  Created by Meghna on 10/02/22.
//

import UIKit

class MoviewCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imgMovie: UIImage!
    
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        prepareCell()
        // Initialization code
    }

}
extension MoviewCollectionCell{
    func prepareCell(){
        backView.backgroundColor = .clear
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 10
    }
}
