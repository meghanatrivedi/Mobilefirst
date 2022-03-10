//
//  ViewController.swift
//  Mobilefirst
//
//  Created by Meghna on 10/02/22.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var mainHeaderView: UIView!
    @IBOutlet weak var lblHeaderName: UILabel!
    @IBOutlet weak var imgSearch: UIImageView!
    @IBOutlet weak var btnSearch: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
        apicalling()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnSearchClick(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MovieCollectionVC") as? MovieCollectionVC
        navigationController?.pushViewController(vc!, animated: false)
    }
}
extension ViewController{
    func prepareUI(){
        tableView.register(UINib(nibName: "MoviewNameCell", bundle: nil), forCellReuseIdentifier: "MoviewNameCell")
    }
}
extension ViewController : UITableViewDelegate ,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviewNameCell", for: indexPath) as! MoviewNameCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200//UITableView.automaticDimension
    }
    
    
}
extension ViewController{
    
    func apicalling(){
        
        
        var url : String = "https://api.themoviedb.org/3/movie/335787?api_key=901694cdb69607e56c217f8f53ef9450"
        var request : NSMutableURLRequest = NSMutableURLRequest()
        request.url = NSURL(string: url) as URL?
        request.httpMethod = "GET"

        NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: OperationQueue(), completionHandler:{ (response:URLResponse!, data: NSData!, error: NSError!) -> Void in
            var error: AutoreleasingUnsafeMutablePointer<NSError?> = nil
            let jsonResult: NSDictionary! = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.MutableContainers, error: error) as? NSDictionary

            if (jsonResult != nil) {
                print(jsonResult)
                // process jsonResult
            } else {
                print("Error  find")
               // couldn't load JSON, look at error
            }


        })
    }
}


