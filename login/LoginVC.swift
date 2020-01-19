import UIKit

class LoginVC: BaseActivity {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginApiCall()
    }
    
    

    @IBAction func loginClick(_ sender: UIButton) {
        print("push called------")
        self.push(storybId: "Dashboard", vcId: "dashboard", vc: self)
    }

    func loginApiCall() {
    request(ALINetwork.Router.baseURLString + ALINetwork.Router.GET_LOGIN).responseJSON(){(JSON) -> Void in
        let response = JSON.result.value as? NSArray
        print("respons data 2", response)
    }
}
}
