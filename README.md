<h1 align="center">Flutter Export Firestore to Excel</h1>
<h3 align="center">A FLutter app to export data from firestore to Excel with headers, stored in global download folder, and automatically open with Excel reader.</h3>

<p align="center">
  
  ![image](https://github.com/user-attachments/assets/93c59dad-eb58-4d85-9497-4fdf2dbbfc5d)
  ![image](https://github.com/user-attachments/assets/c7210c12-295c-440b-a1c3-b8a8de69acf9)
  
</p>

## Feature
- 📊 Export student data to Excel (.xlsx) format
- 🔍 Fetch data from Cloud Firestore
- 📂 Save files directly to device Downloads folder
- 🚀 Auto-open files after export
- 🔄 Progress indicators during operations

## Getting Started

Follow these steps to set up the project locally:

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/favjiw/flutter_export_to_excel.git

2. Navigate to the project directory:

    ```bash
    cd flutter_export_to_excel
    
3. Install the necessary dependencies:

    ```bash
   flutter pub get
  
5. Run the app:

    ```bash
   flutter run

## Dependencies

<table> <tr> <th>Package</th> <th>Version</th> <th>Description</th> </tr> <tr> <td><a href="https://pub.dev/packages/firebase_core">firebase_core</a></td> <td>^3.15.1</td> <td>Firebase core functionality and initialization</td> </tr> <tr> <td><a href="https://pub.dev/packages/cloud_firestore">cloud_firestore</a></td> <td>^5.6.11</td> <td>Firestore NoSQL cloud database service</td> </tr> <tr> <td><a href="https://pub.dev/packages/excel">excel</a></td> <td>^4.0.6</td> <td>Create, read, and edit Excel files (XLSX format)</td> </tr> <tr> <td><a href="https://pub.dev/packages/path_provider">path_provider</a></td> <td>^2.1.5</td> <td>Access device filesystem paths</td> </tr> <tr> <td><a href="https://pub.dev/packages/open_file">open_file</a></td> <td>^3.5.10</td> <td>Open files with default platform applications</td> </tr> <tr> <td><a href="https://pub.dev/packages/external_path">external_path</a></td> <td>^2.2.0</td> <td>Get external storage paths (Downloads, Documents, etc.)</td> </tr> <tr> <td><a href="https://pub.dev/packages/permission_handler">permission_handler</a></td> <td>^12.0.1</td> <td>Request and check runtime permissions</td> </tr> </table>

