import ScadeKit

extension MainPageAdapter {
  var label: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label") as! SCDWidgetsLabel
  }

  var label2: SCDWidgetsLabel {
    return self.page?.getWidgetByName("label2") as! SCDWidgetsLabel
  }

  var button: SCDWidgetsButton {
    return self.page?.getWidgetByName("button") as! SCDWidgetsButton
  }
}