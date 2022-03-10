//
//  MovieCollectionVC.swift
//  Mobilefirst
//
//  Created by Meghna on 10/02/22.
//

import UIKit

class MovieCollectionVC: UIViewController {
    @IBOutlet weak var mainHeaderView: UIView!
    
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var btnclose: UIButton!
    @IBOutlet weak var imgClose: UIImageView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var imgSearch: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registationCell()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCloseClick(_ sender: UIButton) {
        txtSearch.text = ""
        collectionView.isHidden = false
        tableView.isHidden = true
    }
}

extension MovieCollectionVC{
    func registationCell(){
        
        txtSearch.delegate = self
        collectionView.isHidden = false
        tableView.isHidden = true
        self.collectionView.register(UINib(nibName: "MoviewCollectionCell", bundle: nil), forCellWithReuseIdentifier: "MoviewCollectionCell")
        
        tableView.register(UINib(nibName: "SearchMovieCell", bundle: nil), forCellReuseIdentifier: "SearchMovieCell")
        
    }
}
extension MovieCollectionVC : UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    // make a cell for each cell index path
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviewCollectionCell", for: indexPath) as! MoviewCollectionCell
        //cell.lblName.text = "bla bla" //access your Cell's IBOutlets
        return cell
        
        
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print("Selected Cell: \(indexPath.row)")
    }
    
    
    //    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    //        let cell = collectionView.cellForItem(at: indexPath)
    //        cell?.backgroundColor = UIColor.red
    //    }
    
    // change background color back when user releases touch
    //    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
    //        let cell = collectionView.cellForItem(at: indexPath)
    //        //cell?.backgroundColor = UIColor.cyan
    //    }
    
    
//        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//               let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
//               let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
//               let size:CGFloat = (collectionview.frame.size.width - space) / 2.0
//               return CGSize(width: size, height: size)
//           }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)//here your custom value for spacing
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let lay = collectionViewLayout as! UICollectionViewFlowLayout
            let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing
    
            return CGSize(width:widthPerItem, height:200)
        }
    
}
extension MovieCollectionVC: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        collectionView.isHidden = true
        tableView.isHidden = false
        print("shouldChangeCharactersIn")
//            if(textField == cvvTextField){
//                let characterCountLimit = 3
//                let startingLength = textField.text?.count ?? 0
//                let lengthToAdd = string.count
//                let lengthToReplace = range.length
//
//                let newLength = startingLength + lengthToAdd - lengthToReplace
//
//                return newLength <= characterCountLimit
//            }

            return true
        }
}
extension MovieCollectionVC : UITableViewDelegate ,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchMovieCell", for: indexPath) as! SearchMovieCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200//UITableView.automaticDimension
    }
    
    
}
