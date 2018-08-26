//
//  MuralVC.swift
//  Itau_Insights_DreamTeam
//
//  Created by Kesley Ribeiro on 26/08/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit

class MuralVC: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var primeiroView: UIView!
    @IBOutlet weak var segundoView: UIView!
    @IBOutlet weak var terceiroView: UIView!
    
    // MARK: - Properties
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBoardView()
    }
    
    // MARK: - Private function
    
    private func setupBoardView() {
        
        primeiroView.layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 1).cgColor
        primeiroView.layer.shadowOpacity = 1
        primeiroView.layer.shadowRadius = 20
        primeiroView.layer.shadowOffset = CGSize(width: 0, height: 4)
        primeiroView.layer.cornerRadius = 10
        
        segundoView.layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 1).cgColor
        segundoView.layer.shadowOpacity = 1
        segundoView.layer.shadowRadius = 20
        segundoView.layer.shadowOffset = CGSize(width: 0, height: 4)
        segundoView.layer.cornerRadius = 10
        
        terceiroView.layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 1).cgColor
        terceiroView.layer.shadowOpacity = 1
        terceiroView.layer.shadowRadius = 20
        terceiroView.layer.shadowOffset = CGSize(width: 0, height: 4)
        terceiroView.layer.cornerRadius = 10
    }

}
