

import UIKit




class InsultPresenter: UIViewController, UITableViewDelegate
{
    // MARK: Outlets
    @IBOutlet weak var insult: UILabel!
    @IBOutlet weak var comebackTable: UITableView!
    @IBOutlet weak var lifeHUD: UILabel! // Images: Hearts/Swords...
    @IBOutlet weak var pictureView: UIImageView!
    
    
    // MARK: Attributes
    let insultsDatastore = InsultsDatastore()
    let comebacksDatastore = ComebacksDatastore()
    var userLifes = 0 {
        willSet (newValue) {
            self.lifeHUD.text = String(newValue)
        }
    }
    var currentInsult: Insult! {
        didSet(oldInsult) {
            self.insult.text = currentInsult.phrase
        }
    }
    var comebacksDatasource: ComebacksTableDatasource! {
        willSet(newValue) {
            self.comebackTable.dataSource = newValue
            self.comebackTable.reloadData()
        }
    }
    
    
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        userLifes = 3
        newPlay()
    }
    
    
    
    
    // MARK: Game
    
    private func newPlay()
    {
        self.currentInsult = self.insultsDatastore.randomInsult()
        loadComebacks(self.currentInsult)

    }
    
    private func loadComebacks(insult: Insult)
    {
        let comebacks = self.comebacksDatastore.comebacksForInsult(self.currentInsult)
        let comebackResponses = self.comebacksDatastore.shuffleComebacks(comebacks)
        self.comebacksDatasource = ComebacksTableDatasource(comebacks: comebackResponses)
    }
    
    
    
    
    // MARK: TableView Delegate
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        let comeback = self.comebacksDatasource.comebackAtIndex(indexPath.row)
        if (self.currentInsult.isComebackEffective(comeback)) {
            self.pictureView.image = UIImage(named: "guybrush_ok")
        } else {
            self.pictureView.image = UIImage(named: "guybrush_ko")
            self.userLifes -= 1
        }
        
        newPlay()
    }
    
}




