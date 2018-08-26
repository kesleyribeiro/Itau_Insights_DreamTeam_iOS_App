//
//  InsightsVC.swift
//  Itau_Insights_DreamTeam
//
//  Created by Kesley Ribeiro on 26/08/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit

class InsightsVC: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var rodapeView: UIView!
    
    // MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBoardView()
    }

    // MARK: - Private function
    
    private func setupBoardView() {
    
        boardView.layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 1).cgColor
        boardView.layer.shadowOpacity = 1
        boardView.layer.shadowRadius = 20
        boardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        boardView.layer.cornerRadius = 10
        
        rodapeView.layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 1).cgColor
        rodapeView.layer.shadowOpacity = 1
        rodapeView.layer.shadowRadius = 20
        rodapeView.layer.shadowOffset = CGSize(width: 0, height: 4)
        rodapeView.layer.cornerRadius = 10
    }
    
}
