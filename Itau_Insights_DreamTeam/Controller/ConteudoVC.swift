//
//  ConteudoVC.swift
//  Itau_Insights_DreamTeam
//
//  Created by Kesley Ribeiro on 26/08/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit

class ConteudoVC: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet weak var conteudoImageView: UIImageView!
    
    // MARK: - Properties
    
    var indicePagina = 0
    var nomeImagem: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let imagemAtual = nomeImagem {
            conteudoImageView.image = UIImage(named: imagemAtual)
        }
    }    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
