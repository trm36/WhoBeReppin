//
//  SearchViewController.swift
//  whobereppin
//
//  Created by Taylor Mott on 9/16/15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: - Properties
    let states = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    var resultsReps: [Representative] = []
    

    
    //MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func searchButtonTapped(sender: UIButton) {
        
        let index = self.pickerView.selectedRowInComponent(0)
        
        let stateString = self.states[index]
        
        RepresentativeController.searchRepsByState(stateString) { (representatives) in
            
            if representatives.count > 0 {
                self.resultsReps = representatives
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.performSegueWithIdentifier("searchComplete", sender: sender)
                })
                
            } else {
                print("There was an error searching for reps.")
            }
        }
        
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "searchComplete" {
            let resultsListViewController = segue.destinationViewController as! ResultsListViewController
            
            resultsListViewController.repsArray = self.resultsReps
        }
        
    }

}

//MARK: - UIPickerViewDataSource Methods
extension SearchViewController: UIPickerViewDataSource {
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.states.count
    }
    
}

extension SearchViewController: UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.states[row]
    }
    
}
