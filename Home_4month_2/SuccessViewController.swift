//
//  SuccessViewController.swift
//  Home_4month_2
//
//  Created by A LINA on 14/2/24.
//



import UIKit

class SuccessViewController: UIViewController {
    
    
    private lazy var backgroundImageView: UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "success"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    
    private lazy var successLbl = MakerView().makerLabel(text: "Success", size: 20, weight: .semibold,textColor: .white)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backColor")
        setupView()
    }
    
    private func setupView(){
        
        view.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            backgroundImageView.widthAnchor.constraint(equalToConstant: 140),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        view.addSubview(successLbl)
        NSLayoutConstraint.activate([
            successLbl.topAnchor.constraint(equalTo: backgroundImageView.topAnchor,constant: 150),
            successLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            successLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 150),
            successLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -80),
            successLbl.heightAnchor.constraint(equalToConstant: 45 )
        ])
        
        
    }
    
}
