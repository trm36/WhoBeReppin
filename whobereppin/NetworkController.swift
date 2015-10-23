//
//  NetworkController.swift
//  whobereppin
//
//  Created by Taylor Mott on 9/17/15.
//  Copyright © 2015 Mott Applications. All rights reserved.
//

import Foundation

class NetworkController: NSObject {
    
    static func baseURLString() -> String {
        return "http://whoismyrepresentative.com"
    }
    
    static func searchURLByState(state: String) -> NSURL {
        return NSURL(string: NetworkController.baseURLString() + "/getall_reps_bystate.php?state=\(state)&output=json")!
    }
    
    static func dataAtURL(url: NSURL, completion:(resultData: NSData?) -> Void) {
        let session = NSURLSession.sharedSession()
        
        let dataTask = session.dataTaskWithURL(url) { (data, _, error) -> Void in
            
            guard let data = data  else {
                print(error?.localizedDescription)
                completion(resultData: nil)
                return
            }
            
            completion(resultData: data)
        }
        
        dataTask.resume()
    }
    
}
