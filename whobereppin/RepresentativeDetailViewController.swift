//
//  RepresentativeDetailViewController.swift
//  whobereppin
//
//  Created by Taylor Mott on 9/16/15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit

class RepresentativeDetailViewController: UIViewController {
    
    @IBOutlet weak var stateImageView: UIImageView!
    @IBOutlet weak var districtLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyTextView: UITextView!
    @IBOutlet weak var phoneNumberTextView: UITextView!
    @IBOutlet weak var addressTextView: UITextView!
    @IBOutlet weak var websiteTextView: UITextView!

    var rep: Representative?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let rep = self.rep else { return }
        
        if let state = rep.state {
            stateImageView.image = UIImage(named: state)
        }
        stateLabel.text = rep.state
        districtLabel.text = rep.district
        nameLabel.text = rep.name
        partyTextView.text = rep.party
        phoneNumberTextView.text = rep.phone
        addressTextView.text = rep.office
        websiteTextView.text = rep.link
        
    }
    
//    func updateWithRepresentative(rep: Representative) {
//        self.rep = rep
//        
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
