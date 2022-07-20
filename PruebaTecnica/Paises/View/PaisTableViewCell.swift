//
//  PaisTableViewCell.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import UIKit

class PaisTableViewCell: UITableViewCell {
    static let cellIdentifier = "PaisTableViewCell"
    private var nombrePais: UILabel!
    private var imagenSeleccionado: UIImageView!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            imagenSeleccionado.isHidden = false
        } else {
            imagenSeleccionado.isHidden = true
        }
    }
    private func setupCell() {
        nombrePais = UILabel(frame: .zero)
        nombrePais.translatesAutoresizingMaskIntoConstraints = false
        nombrePais.numberOfLines = 1
        nombrePais.adjustsFontSizeToFitWidth = true
        nombrePais.font = UIFont(name: CustomFonts.GothamBook, size: 12)
        nombrePais.textColor = UIColor(red: 0.44, green: 0.44, blue: 0.44, alpha: 1.00)
        
        imagenSeleccionado = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        imagenSeleccionado.tintColor = .systemGreen
        imagenSeleccionado.translatesAutoresizingMaskIntoConstraints = false
        imagenSeleccionado.contentMode = .scaleAspectFit
        imagenSeleccionado.isHidden = true
        
        addSubview(nombrePais)
        addSubview(imagenSeleccionado)
        
        addCellConstraints()
    }
    
    
    
    private func addCellConstraints() {
        NSLayoutConstraint.activate([
            imagenSeleccionado.centerYAnchor.constraint(equalTo: centerYAnchor),
            imagenSeleccionado.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imagenSeleccionado.heightAnchor.constraint(equalToConstant: 40),
            imagenSeleccionado.widthAnchor.constraint(equalToConstant: 40),
            
            nombrePais.centerYAnchor.constraint(equalTo: centerYAnchor),
            nombrePais.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nombrePais.trailingAnchor.constraint(equalTo: imagenSeleccionado.leadingAnchor, constant: -10)
        ])
    }
    
    func fillCellData(with nombrePais: String) {
        self.nombrePais.text = nombrePais
    }
}
