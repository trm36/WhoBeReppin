//
//  ResultsListViewController.swift
//  whobereppin
//
//  Created by Taylor Mott on 9/16/15.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

import UIKit

class ResultsListViewController: UIViewController {
    
    var repsArray: [Representative] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "repTapped" {
            guard let cell = sender as? UITableViewCell else { return }
                
            let indexPath = self.tableView.indexPathForCell(cell)!
            let rep = self.repsArray[indexPath.row]
            
            let detailViewController = segue.destinationViewController as! RepresentativeDetailViewController
            detailViewController.rep = rep
        }
    }
}

extension ResultsListViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repsArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CellID", forIndexPath: indexPath)
        
        let rep = self.repsArray[indexPath.row]
    
        if let name = rep.name, party = rep.party {
            cell.textLabel?.text = name
            cell.detailTextLabel?.text = party
        }
    
        return cell
    }
    
    
    
    
    
}

