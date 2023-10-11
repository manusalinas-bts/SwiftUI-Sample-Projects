//
//  MainTableController.swift
//  TO-DO-LIST
//
//  Created by Manuel Salinas on 7/11/23.
//

import UIKit

class MainTableController: UITableViewController {
    private var viewModel = HomeViewModel()
    private var itemsSelected = [ToDoTask]()
    private var items = [ToDoTask]() {
        didSet {
            DispatchQueue.main.async {
                if self.items.isEmpty {
                    self.tableView.showEmptyState("No Tasks")
                } else {
                    self.tableView.deleteEmptyState()
                }
                
                self.tableView.reloadData()
            }
        }
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        //getTasks()
        //getAsyncTask()
        getAsyncGenericTask()
    }
    
    // MARK: Setup
    private func setup() {
        title = "Lux To-Do"
        
        tableView.register(UINib(nibName: "TaskTableCell", bundle: nil), forCellReuseIdentifier: "TaskTableCell")
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(getTasks), for: .valueChanged)
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: Fetch Data
    @objc
    private func getTasks() {
        print("Using getTasks... ")
        items.removeAll()

        // * * * * Closure Option
        /*
        viewModel.fetchData { [weak self] (result: Result<[ToDoTask], Error>) in
            DispatchQueue.main.async { self?.tableView.refreshControl?.endRefreshing() }

            switch result {
            case .success(let responseItems):
                self?.items = responseItems.sorted(by: { ($0.details?.day ?? 0) < ($1.details?.day ?? 0) })

            case .failure(let error):
                DispatchQueue.main.async {
                    self?.tableView.showEmptyState(error.localizedDescription)
                }
            }
        }
         */
        
        // * * * * Async wrapper Option
        Task {
            do {
                let tasks: [ToDoTask] = try await viewModel.fetchData()
                items = tasks.sorted(by: { ($0.details?.day ?? 0) < ($1.details?.day ?? 0) })
                
                tableView.refreshControl?.endRefreshing()
            } catch {
                tableView.showEmptyState(error.localizedDescription)
            }
        }
    }
    
    private func getAsyncTask() {
        print("Using getAsyncTask... ")
        items.removeAll()
        
        Task {
            do {
                items = try await viewModel.fetchToDoTasks().sorted(by: { ($0.details?.day ?? 0) < ($1.details?.day ?? 0) })
            } catch  {
                tableView.showEmptyState(error.localizedDescription)
            }
        }
    }
    
    private func getAsyncGenericTask() {
        print("Using getAsyncGenericTask... ")
        items.removeAll()
        
        Task {
            do {
                let tasks: [ToDoTask] = try await viewModel.fetchToDoTasksGeneric()
                items = tasks.sorted(by: { ($0.details?.day ?? 0) < ($1.details?.day ?? 0) })
                
            } catch {
                tableView.showEmptyState((error as! ApiError).customDescription)
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableCell", for: indexPath) as? TaskTableCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.selectedStyle(itemsSelected.contains(where: { $0.title == item.title }), for: item)
        cell.onSelection = { [weak self] in
            guard let self else { return }
        
            if let index = self.itemsSelected.firstIndex(where: { $0.title == item.title }) {
                self.itemsSelected.remove(at: index)
                
            } else {
                self.itemsSelected.append(item)
            }
            
            DispatchQueue.main.async {
                self.tableView.reloadRows(at: [indexPath], with: .fade)
            }
        }

        return cell
    }
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
         if cell.responds(to: #selector(setter: UITableViewCell.separatorInset)) {
             cell.separatorInset = UIEdgeInsets.zero
         }
         
         if cell.responds(to: #selector(setter: UIView.preservesSuperviewLayoutMargins)) {
             cell.preservesSuperviewLayoutMargins = false
         }
         
         if cell.responds(to: #selector(setter: UIView.layoutMargins)) {
             cell.layoutMargins = UIEdgeInsets.zero
         }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.rowHeight //UITableView.automaticDimension
    }
    
    // MARK: Deinit
    deinit {
        print("Deinit: \(String(describing: MainTableController.self))")
    }
}
