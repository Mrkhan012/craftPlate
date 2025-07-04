# 🍽️ CraftMyPlate

CraftMyPlate is a Flutter-based modern food platter selection and customization app with an elegant UI/UX. It enables users to explore curated menus, select delivery slots, and view dynamic pricing.

---

## 📱 Features

- 🔥 Clean and responsive UI built with `flutter_screenutil`
- 🧠 State management with `GetX`
- 🪟 Custom animated bottom sheets with tabs and slot selection
- 🍽️ Menu cards with quick access to detailed menus
- 📆 Date and time slot selection with visual feedback
- 🎨 Consistent theming and reusable custom components

---

## 🛠️ Tech Stack

| Technology     | Description                        |
|----------------|------------------------------------|
| Flutter        | Frontend SDK                       |
| GetX           | Lightweight state management       |
| flutter_screenutil | Responsive UI utility          |
| gap            | Spacing utility                    |
| Cupertino Icons| iOS-style icons support            |

---

## 📂 Folder Structure

```bash
lib/
├── controller/         # GetX controllers
│   └── home_controller.dart
├── view/
│   ├── home/
│   │   ├── widget/
│   │   │   └── custom_card.dart
│   │   └── home_view.dart
│   └── shared/
│       └── menu_bottom_sheet.dart
├── utils/
│   └── appcolor.dart
└── main.dart
