> **Note:** To access all shared projects, get information about environment setup, and view other guides, please visit [Explore-In-HMOS-Wearable Index](https://github.com/Explore-In-HMOS-Wearable/hmos-index).

# Story Time

This mobile application offers a simple and intuitive way to manage a personal book list. With its clean design and smooth interactions, users can easily add new books, browse their collection in a scrollable view, and remove items when needed. Books can be deleted quickly by swiping left or right to reveal a delete button, providing a seamless user experience. Designed for responsiveness and mobility, the app serves as a practical solution for readers who want to keep track of their reading list on the go.

# Preview

<div>
   <img src="./images/1.png" width="24%"/>
   <img src="./images/2.png" width="24%"/>
   <img src="./images/4.png" width="24%"/>
   <img src="./images/5.png" width="24%"/>
</div>

# Use Cases

1. Users can add a new book to their personal book list.

2. Users can view all added books in a scrollable layout.

3. Users can delete a book by swiping left or right and tapping the delete button.

4. Users can manage their reading progress by updating the list as they read.

5. Users can organize their book list on the go with a responsive interface.

# Tech Stack

- **Languages**: ArkTS
- **Frameworks**: HarmonyOS SDK 5.1.0(18)
- **Tools**: DevEco Studio Vers 5.1.0.842
- **Libraries**: @kit.RemoteCommunicationKit, @kit.ArkUI

# Project Directory
   ```
   entry/src/main/ets/
    ├── components/
    │ ├── Books.ets                           // Books Object
    ├── pages/
    │ ├── DeleteRequestContent.ets            // It can be delete books from the list
    │ ├── GetRequestContent.ets               // It can show UI design for book list
    │ ├── PostRequestContent.ets              // Adding a book page          
    │ ├── Index.ets                           // Home Page
   ```

# Constraints and Restrictions
## Suported Devices
- Huawei Watch 5

# Limitations
- Remote Communication Kit is not working on the previewer.

# License
**StoryTime** is distributed under the terms of the MIT License
See the [LICENSE](./LICENSE) for more information.