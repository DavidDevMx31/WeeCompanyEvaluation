//
//  PaisesViewController.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import UIKit

class PaisesViewController: UIViewController {
    private var paisesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
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
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
