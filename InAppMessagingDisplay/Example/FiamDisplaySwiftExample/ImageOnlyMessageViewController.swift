/*
 * Copyright 2018 Google
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import UIKit
import FirebaseInAppMessaging

class ImageOnlyMessageViewController: CommonMessageTestVC {
  let displayImpl = InAppMessagingDefaultDisplayImpl()

  @IBOutlet var verifyLabel: UILabel!

  override func messageClicked() {
    super.messageClicked()
    verifyLabel.text = "message clicked!"
  }

  override func messageDismissed(dismissType dimissType: FIRInAppMessagingDismissType) {
    super.messageClicked()
    verifyLabel.text = "message dismissed!"
  }

  @IBAction func showRegularImageOnlyTapped(_ sender: Any) {
    verifyLabel.text = "Verification Label"
    let imageRawData = produceImageOfSize(size: CGSize(width: 200, height: 200))
    let fiamImageData = InAppMessagingImageData(imageURL: "url not important", imageData: imageRawData!)

    let modalMessage = InAppMessagingImageOnlyDisplay(messageID: "messageId",
                                                      renderAsTestMessage: false,
                                                      imageData: fiamImageData)

    displayImpl.displayMessage(modalMessage, displayDelegate: self)
  }

  @IBAction func showImageViewWithLargeImageDimensionTapped(_ sender: Any) {
    verifyLabel.text = "Verification Label"
    let imageRawData = produceImageOfSize(size: CGSize(width: 1000, height: 1000))
    let fiamImageData = InAppMessagingImageData(imageURL: "url not important", imageData: imageRawData!)

    let modalMessage = InAppMessagingImageOnlyDisplay(messageID: "messageId",
                                                      renderAsTestMessage: false,
                                                      imageData: fiamImageData)

    displayImpl.displayMessage(modalMessage, displayDelegate: self)
  }

  @IBAction func showImageViewWithWideImage(_ sender: Any) {
    verifyLabel.text = "Verification Label"
    let imageRawData = produceImageOfSize(size: CGSize(width: 1000, height: 100))
    let fiamImageData = InAppMessagingImageData(imageURL: "url not important", imageData: imageRawData!)

    let modalMessage = InAppMessagingImageOnlyDisplay(messageID: "messageId",
                                                      renderAsTestMessage: false,
                                                      imageData: fiamImageData)

    displayImpl.displayMessage(modalMessage, displayDelegate: self)
  }

  @IBAction func showImageViewWithNarrowImage(_ sender: Any) {
    verifyLabel.text = "Verification Label"
    let imageRawData = produceImageOfSize(size: CGSize(width: 100, height: 1000))
    let fiamImageData = InAppMessagingImageData(imageURL: "url not important", imageData: imageRawData!)

    let modalMessage = InAppMessagingImageOnlyDisplay(messageID: "messageId",
                                                      renderAsTestMessage: false,
                                                      imageData: fiamImageData)

    displayImpl.displayMessage(modalMessage, displayDelegate: self)
  }

  @IBAction func showImageViewWithSmallImageDimensionTapped(_ sender: Any) {
    let imageRawData = produceImageOfSize(size: CGSize(width: 50, height: 50))
    let fiamImageData = InAppMessagingImageData(imageURL: "url not important", imageData: imageRawData!)

    let modalMessage = InAppMessagingImageOnlyDisplay(messageID: "messageId",
                                                      renderAsTestMessage: false,
                                                      imageData: fiamImageData)

    displayImpl.displayMessage(modalMessage, displayDelegate: self)
  }
}
