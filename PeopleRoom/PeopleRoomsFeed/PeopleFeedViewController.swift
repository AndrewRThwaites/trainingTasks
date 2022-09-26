
//
//  ViewController.swift
//  PeopleFRoom App
//
//  Created by AThwaites on 20/09/2022.
//

import UIKit

final class PeopleFeedViewController: UIViewController {

    var viewModel: PeopleFeedViewModel?
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
    
    override func loadView() {
        super.loadView()
        Task {
            await viewModel?.getNewsAsync()
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        setupTableView()
    }
     
    private func setupTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        tableView.register(PeopleFeedTableViewCell.self, forCellReuseIdentifier: "peopleCell")
    }
}

extension PeopleFeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.peopleRecordCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "peopleCell", for: indexPath) as? PeopleFeedTableViewCell else {
            return UITableViewCell()
        }
        
        if let viewModel = viewModel {
            let people = viewModel.getPeopleModel(index: indexPath.row)
             
            // forced unwrapping is ok as default values have been assigned if nil
            cell.textLabel?.text = people.firstName! + " " + people.lastName!
        }
        return cell
    }
}
