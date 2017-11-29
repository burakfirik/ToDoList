
import UIKit

class CompleteViewController: UIViewController {

  
  var previousVC = ToDoTableViewController()
  var selectedTask = Task()
  
  @IBOutlet weak var taskDesc: UILabel!
  @IBAction func completeTapped(_ sender: Any) {
    var index = 0;
    for task in previousVC.tasks {
      
      if task.name == selectedTask.name {
        previousVC.tasks.remove(at: index)
        previousVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        break
      }
      index += 1
    }
  }
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDesc.text = selectedTask.name
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
