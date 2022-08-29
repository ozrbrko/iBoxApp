# iBoxApp

iBoxApp is my new Flutter project.

## Getting Started

iBox is a mobile application where the user can learn calendar, weather, seasonal food information, current news, pharmacies on duty, instant exchange, crypto information. With the Note tab, users can add, update, and delete notes.


Software technologies for this project:

SQFLITE

    * Login, Register screen design and user login processes are done using SQFLITE. By using SQFLITE, the user's information is taken from the register page and saved in the database created in the device's memory (local cache). For the login process, the information here is matched and the login is provided.
    
    * Operations on the Notes page were made using SQFLITE. This information is saved in the local cache created database.

SharedPreferences for autologin

    * Once the user logs in, the login stays on until they log out. This process is provided with SharedPreferences.
  
Mobx

    * Mobx (dio) state management approach is used.
    
    
CollectApi

    * Services on CollectApi are used.

MVVM

    * MVVM architecture is used.
    
    
 
    
<img src= w![Screenshot_1661758027](https://user-images.githubusercontent.com/46723964/187215661-6146e8f4-f490-4a6c-9ab1-83165a5c2d31.png)
idth="128"/>


