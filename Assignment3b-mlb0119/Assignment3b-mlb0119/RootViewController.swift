//
//  MainViewController.swift
//  Assignment3b-mlb0119
//
//  Created by Matthew Bentz on 7/23/20.
//  Copyright © 2020 Matthew Bentz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let cellTableIdentifier = "CellTableIdentifier"
    @IBOutlet weak var tableView: UITableView!
    
    public var albums = [
        ["Title" : "Hollywood's Bleeding", "Artist" : "Post Malone", "Year" : "2019", "Label" : "Republic Records"],
        ["Title" : "beerbongs & bentleys", "Artist" : "Post Malone", "Year" : "2018", "Label" : "Republic Records"],
        ["Title" : "Stoney (Deluxe)", "Artist" : "Post Malone", "Year" : "2016", "Label" : "Republic Records"],
        ["Title" : "Legends Never Die", "Artist" : "Juice WRLD", "Year" : "2020", "Label" : "Interscope Records"],
        ["Title" : "Death Race For Love", "Artist" : "Juice WRLD", "Year" : "2019", "Label" : "Interscope Records"],
        ["Title" : "Goodbye & Good Riddance", "Artist" : "Juice WRLD", "Year" : "2018", "Label" : "Interscope Records"],
        ["Title" : "Night Visions", "Artist" : "Imagine Dragons", "Year" : "2012", "Label" : "Interscope Records"],
        ["Title" : "Recovery", "Artist" : "Eminem", "Year" : "2010", "Label" : "Aftermath Records"],
        ["Title" : "Relapse", "Artist" : "Eminem", "Year" : "2009", "Label" : "Aftermath Records"],
        ["Title" : "The Eminem Show", "Artist" : "Eminem", "Year" : "2002", "Label" : "Aftermath Records"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Registers the table view to use AlbumCell.xib
        let xib = UINib(nibName: "AlbumCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: cellTableIdentifier)
        tableView.rowHeight = 65
        
        // Add and Edit buttons
        navigationItem.rightBarButtonItem = editButtonItem
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTapped))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    // Adds new album to table view
    @objc func addTapped() {
        albums.append(["Title" : "New Album", "Artist" : "New Artist", "Year" : "2020", "Label" : "New Label"])
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: albums.count - 1, section: 0)], with: .automatic)
        tableView.endUpdates()
    }
    
    // MARK: -
    // MARK: Table View Data Source Methods
    
    // Returns the number of albums for row count
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    // Populates cell data in the table view from albums array
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: cellTableIdentifier, for: indexPath)
            as! AlbumCell
        
        let rowData = albums[indexPath.row]
        cell.title = rowData["Title"]!
        cell.artist = rowData["Artist"]!
        
        return cell
    }
    
    // Segue functionality for selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailViewSegue", sender: tableView.cellForRow(at: indexPath))
    }
    
    // Allows editing for every index
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Allows editing for the tableView, since this does not inherit UITableViewController
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.setEditing(editing, animated: true)
    }
        
    // Allows for moving of rows
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Allows for deleting of rows
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            albums.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    
    // When moved, remove at source and insert at destination
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedAlbum = albums.remove(at: sourceIndexPath.row)
        albums.insert(movedAlbum, at: destinationIndexPath.row)
    }
    
    // Sends selected album information to the detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! AlbumCell
        let indexPath = tableView.indexPath(for: cell)
        
        let detailVC = segue.destination as! DetailViewController
        
        let rowData = albums[indexPath!.row]
        detailVC.receivedAlbum = rowData["Title"]!
        detailVC.receivedArtist = rowData["Artist"]!
        detailVC.receivedYear = rowData["Year"]!
        detailVC.receivedLabel = rowData["Label"]!
    }


}

