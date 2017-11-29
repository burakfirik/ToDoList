
import UIKit

class CompleteViewController: UIViewController {

  
  var previousVC = ToDoTableViewController()
  var selectedTask:TaskCore?
  
  @IBOutlet weak var taskDesc: UILabel!
  
  @IBAction func completeTapped(_ sender: Any) {
    if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
      if let theTask = selectedTask {
        context.delete(theTask)
        navigationController?.popViewController(animated: true)
      }
    }
    
    
    /*
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
 */
  }
    override func viewDidLoad() {
        super.viewDidLoad()
        taskDesc.text = selectedTask?.name
       // taskDesc.text = "Selam"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
