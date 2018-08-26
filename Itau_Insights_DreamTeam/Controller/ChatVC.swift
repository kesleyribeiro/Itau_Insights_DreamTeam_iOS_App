//
//  ChatVC.swift
//  Itau_Insights_DreamTeam
//
//  Created by Kesley Ribeiro on 26/08/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit
import SafariServices

class ChatVC: UIViewController, SFSafariViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //carregarChatbot()
    }

    // MARK: - Private function

    func carregarChatbot() {

        if let url = URL(string: "http://ec2-18-188-175-118.us-east-2.compute.amazonaws.com/") {
            let vc = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            present(vc, animated: true)
        }
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        dismiss(animated: false, completion: nil)
    }
}
