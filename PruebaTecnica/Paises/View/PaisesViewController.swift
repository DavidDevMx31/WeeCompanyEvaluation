//
//  PaisesViewController.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import UIKit

class PaisesViewController: UIViewController {
    private var paisesTableView: UITableView!
    private var presenter: PaisesPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePresenter()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.getPaises()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.detachView()
    }
    
    private func configurePresenter() {
        presenter = PaisesPresenter()
        presenter.attachView(self)
    }

    private func configureView() {
        title = "Países"
        configureTableView()
        addViewConstraints()
    }
    
    private func configureTableView() {
        paisesTableView = UITableView(frame: .zero)
        paisesTableView.translatesAutoresizingMaskIntoConstraints = false
        paisesTableView.allowsSelection = true
        paisesTableView.allowsMultipleSelection = false
        
        paisesTableView.register(PaisTableViewCell.self, forCellReuseIdentifier: PaisTableViewCell.cellIdentifier)
        paisesTableView.delegate = self
        paisesTableView.dataSource = self
        
        view.addSubview(paisesTableView)
    }

    private func addViewConstraints() {
        NSLayoutConstraint.activate([
            paisesTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            paisesTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            paisesTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            paisesTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

//MARK: UITableViewDelegates
extension PaisesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.paises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = paisesTableView.dequeueReusableCell(withIdentifier: PaisTableViewCell.cellIdentifier) as! PaisTableViewCell
        let pais = presenter.paises[indexPath.row]
        cell.fillCellData(with: pais.nombre)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pais = presenter.paises[indexPath.row]
        
        let selectedVC = SelectedViewController()
        selectedVC.paisSeleccionado = pais.nombre
        selectedVC.modalPresentationStyle = .formSheet
        selectedVC.modalTransitionStyle = .coverVertical
        
        present(selectedVC, animated: true)
    }
}

//MARK: PaisesView protocol
extension PaisesViewController: PaisesView {
    
    func showPaises() {
        paisesTableView.reloadData()
    }
    
    func showError(_ message: String) {
        print(message)
        let ac = UIAlertController(title: "Ocurrió un error al consultar la información", message: message, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
}
