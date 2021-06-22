//
//  SelectedViewController.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import UIKit

class SelectedViewController: UIViewController {
    private var titleLabel: UILabel!
    private var messageLabel: UILabel!
    private var alertImage: UIImageView!
    
    var paisSeleccionado: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        view.backgroundColor = .white
        
        titleLabel = UILabel(frame: .zero)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Click, \(paisSeleccionado ?? "")"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont(name: CustomFonts.GothamPro, size: 15)
        titleLabel.textColor = UIColor(red: 0.02, green: 0.49, blue: 0.72, alpha: 1.00)
        
        messageLabel = UILabel(frame: .zero)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.text = "Has dado clic en el estado de \(paisSeleccionado ?? "")"
        messageLabel.numberOfLines = 2
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: CustomFonts.GothamBook, size: 12)
        messageLabel.textColor = UIColor(red: 0.02, green: 0.49, blue: 0.72, alpha: 1.00)
        
        alertImage = UIImageView(image: UIImage(named: "img_like"))
        alertImage.translatesAutoresizingMaskIntoConstraints = false
        alertImage.contentMode = .scaleAspectFit
        
        view.addSubview(titleLabel)
        view.addSubview(messageLabel)
        view.addSubview(alertImage)
        
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: alertImage.topAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            alertImage.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            alertImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            alertImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            alertImage.heightAnchor.constraint(equalTo: alertImage.widthAnchor),
            
            messageLabel.topAnchor.constraint(equalTo: alertImage.bottomAnchor, constant: 10),
            messageLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            messageLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        ])
    }
    
}
