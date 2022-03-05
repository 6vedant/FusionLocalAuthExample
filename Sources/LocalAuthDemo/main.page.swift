import FusionLocalAuth
import ScadeKit

class MainPageAdapter: SCDLatticePageAdapter {

  let localAuth: LocalAuthManager = LocalAuthManager()

  // page adapter initialization
  override func load(_ path: String) {
    super.load(path)

    let bool = localAuth.canAuthenticateWithBiometrics()
    if !bool {
      self.label.text = "The device can't authenticate using Biometrics!"
    } else {

      self.label.text = "The device can authenticate with biometrics"
    }

    self.button.onClick { [weak self] _ in
      print("clicked")
      guard let S = self else { return }

      S.localAuth.requestBiometricAuthentication(
        authTitle: "authTitle", reasonTitle: "reasonTitle", cancelTitle: "cancelTitle",
        completionStatus: { [weak self] (success, error) in

          guard success else {
            print(error?.description)
            S.label2.text = "Auth Failed"
            return
          }

          S.label2.text = "Auth Successful"

        })

    }

  }
}
