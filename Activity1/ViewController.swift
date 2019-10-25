//
//  ViewController.swift
//  Activity1
//
//  Created by Himanshu Mehta on 2019-10-25.
//  Copyright © 2019 Himanshu Mehta. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate {

    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    @IBOutlet weak var checkConnection: UILabel!
    override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            
            if(WCSession.isSupported() == true){
                checkConnection.text = "WC is supported"
                
    //            create a communication session with the watch?
                    let session = WCSession.default
                         session.delegate = self
                         session.activate()
                     }
                     else {
                         checkConnection.text = "WC NOT supported!"
                     }
        }
    
    @IBOutlet weak var sendMessageOutputLabel: UILabel!
    @IBAction func sendMessgaeButton(_ sender: Any) {
        
               print("Sending message to watch")
                   // ------ SEND MESSAGE TO WATCH CODE GOES HERE

                if(WCSession.default.isReachable == true){
        //            Here is the message you want to send to the watch
                    let message = ["name":"Pritish" , "age": "20"]
                    WCSession.default.sendMessage(message, replyHandler: nil)
//                    messageCounter = messageCounter+1
                  sendMessageOutputLabel.text = "Message Sent"
                    }
                    else {
//                        messageCounter = messageCounter + 1
                        sendMessageOutputLabel.text = "Cannot reach watch! "
                    }
    }
    
    


}

