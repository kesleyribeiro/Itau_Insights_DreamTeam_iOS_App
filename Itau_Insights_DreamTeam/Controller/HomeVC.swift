//
//  HomeVC.swift
//  Itau_Insights_DreamTeam
//
//  Created by Kesley Ribeiro on 26/08/18.
//  Copyright © 2018 Kesley Ribeiro. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var boardView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Properties
    
    var pageViewController: UIPageViewController?
    let arrayImagens = ["primeiro", "segundo"]
    var atualIndice = 0
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPageViewController()
    }
    
    // MARK: - Private function
    
    private func setPageViewController() {
        
        let pageVC = self.storyboard?.instantiateViewController(withIdentifier: "pageVC") as! UIPageViewController
        
        pageVC.dataSource = self
        
        let firstController = getViewController(atIndex: 0)
        
        pageVC.setViewControllers([firstController], direction: .forward, animated: true, completion: nil)
        
        self.pageViewController = pageVC
        
        self.addChildViewController(self.pageViewController!)
        self.boardView.addSubview(self.pageViewController!.view)
        self.pageViewController?.didMove(toParentViewController: self)
    }
    
    fileprivate func getViewController(atIndex index: Int) -> ConteudoVC {
        let conteudoVC = self.storyboard?.instantiateViewController(withIdentifier: "conteudoVC") as! ConteudoVC
        
        conteudoVC.nomeImagem = arrayImagens[index]
        conteudoVC.indicePagina = index
        
        return conteudoVC
    }
    
    private func proximoSlide() {
        
        atualIndice += 1
        
        if atualIndice == arrayImagens.count {
            atualIndice = 0
        }
        
        let nextController = getViewController(atIndex: atualIndice)
        
        self.pageViewController?.setViewControllers([nextController], direction: .forward, animated: true, completion: nil)
        
        self.pageControl.currentPage = atualIndice
    }

    @IBAction func proximoSlideAction(_ sender: Any) {
        
        proximoSlide()
    }
}

// MARK: - UIPageViewControllerDatasource

extension HomeVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let conteudoVC = viewController as! ConteudoVC
        var index = conteudoVC.indicePagina
        
        if index == 0 || index == NSNotFound {
            return getViewController(atIndex: arrayImagens.count - 1)
            
            // 0  | 1 | 2 | 0 | 1 | 2 | ...
            
        }
        
        index -= 1 // index = index - 1
        
        return getViewController(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        let conteudoVC = viewController as! ConteudoVC
        var index = conteudoVC.indicePagina
        
        if index == NSNotFound {
            return nil
        }
        
        index += 1  // index = index + 1
        
        if index == arrayImagens.count {
            return getViewController(atIndex: 0)
        }
        
        return getViewController(atIndex: index)
    }
}
