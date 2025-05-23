🛍️ Store App
A modern Flutter e-commerce app that allows users to browse a list of products, view detailed product information, mark favorites, and filter by price range. Built using clean architecture principles with state management, local caching, navigation, and animations for a smooth user experience.
 
 ✨ Features
🛒 Product Listing: Browse a list of products fetched from a remote API.

📄 Product Details: View detailed information with image previews and animations.

❤️ Favorites: Mark/unmark products as favorites with persistence using local storage (Hive).

🔍 Price Filter & Search: Filter and search products by price range.

🌀 Smooth Animations: Image transitions and interactive UI animations.

🧭 Navigation: Seamless routing using go_router.

⚙️ Robust State Management: Built with Cubit from the flutter_bloc package.

🌐 Networking: Uses Dio for efficient and structured API calls.

📦 Local Caching: Favorites are saved using Hive for offline access.

| Tool                      | Description                                    |
| ------------------------- | ---------------------------------------------- |
| **Flutter**               | UI toolkit for building natively compiled apps |
| **Dio**                   | Handles API requests                           |
| **Cubit (flutter\_bloc)** | Lightweight state management                   |
| **Hive**                  | Local storage for caching favorites            |
| **go\_router**            | Declarative and structured navigation          |
| **CachedNetworkImage**    | For efficient image loading and caching        |
| **Hero Widgets**          | For shared element transitions between views   |

🗂️ Project Structure
lib/
├── features/
│   ├── home/
│   │   ├── cubit/
│   │   └── domain/
│   ├── product_details/
│   │   ├── cubit/
│   │   └── view/
├── data/
│   └── models, repositories, remote sources
├── utils/
│   └── styles
├── main.dart


Can you login using this account:
email: ruby@mail.com
pass: 123456

