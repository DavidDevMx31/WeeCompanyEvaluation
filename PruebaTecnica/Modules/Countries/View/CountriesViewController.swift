//
//  CountriesViewController.swift
//  PruebaTecnica
//
//  Created by David Ali on 22/06/21.
//

import UIKit

class CountriesViewController: UIViewController {
    private var paisesTableView: UITableView!
    private var presenter: CountriesPresenter!
    
    var onCountryCellTap: ((String) -> ())?
    var onError: ((String) -> ())?

    init(presenter: CountriesPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        paisesTableView.register(CountryTableViewCell.self, forCellReuseIdentifier: CountryTableViewCell.cellIdentifier)
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
extension CountriesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.paises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = paisesTableView.dequeueReusableCell(withIdentifier: CountryTableViewCell.cellIdentifier) as! CountryTableViewCell
        let pais = presenter.paises[indexPath.row]
        cell.fillCellData(with: pais.displayName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pais = presenter.paises[indexPath.row]
        onCountryCellTap?(pais.name)
    }
}

//MARK: PaisesView protocol
extension CountriesViewController: CountriesView {
    
    func showPaises() {
        paisesTableView.reloadData()
    }
    
    func showError(_ message: String) {
        debugPrint("Error: \(message)")
        onError?(message)
    }
    
}
