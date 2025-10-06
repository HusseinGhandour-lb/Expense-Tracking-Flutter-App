💰 Flutter Expense Tracker App

A simple and responsive Flutter application that helps users track, visualize, and manage expenses easily.
Users can add and remove expenses which are dynamically displayed in a chart and a list view.

---

✨ Features

  .Responsive UI
   Works smoothly in both portrait and landscape modes for mobile devices.
  .Dark Mode Support
   The app automatically adapts to the system’s dark or light theme.
  .Add New Expense
   Uses a showModalBottomSheet where users can input new expenses.
  .Remove Expense
   Users can delete existing expenses from the list instantly.
  .Data Handling
   All data is stored temporarily in an in-memory array (no database).
  .Widgets Used
   Built using Flutter’s Card and ListView widgets for a clean, modern layout.

---

🖼️ App Flow

Main Screen → Displays chart + list of expenses
Add Expense → Tap the “+” button to open a bottom sheet and enter expense details
Expense List → View all added expenses in a scrollable list
Chart Section → Visual summary of total expenses for the week
Remove Expense → Swipe the expense card to remove the expense

---

📂 Project Structure
lib/
│
├── model/
│   └── expense.dart               # Expense data model
│
├── widget/
│   ├── chart/
│   │   ├── chart.dart             # Main chart widget
│   │   └── chart_bar.dart         # Bar widget for each day’s expense
│   │
│   ├── expense-list/
│   │   ├── expenses_list.dart     # Widget to display list of expenses
│   │   └── expense_item.dart      # Individual expense item widget
│   │
│   ├── new_expense.dart           # Modal for adding new expenses
│   └── expenses.dart              # Combines chart and list into main screen
│
└── main.dart                      # App entry point

---

🚀 Getting Started
Prerequisites

Flutter SDK
 installed

Android Studio or VS Code with Flutter & Dart plugins

---

Installation & Run
# Clone this repository
git clone https://github.com/your-username/flutter-expense-tracker.git

# Navigate to the project folder
cd flutter-expense-tracker

# Get dependencies
flutter pub get

# Run the app
flutter run
