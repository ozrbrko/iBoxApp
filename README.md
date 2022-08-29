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
    
    
    
    


![Screenshot_1661758027](https://user-images.githubusercontent.com/46723964/187215090-3f0134ee-1513-4c8d-a45b-cdac3ba4645b.png)
![Screenshot_1661758031](https://user-images.githubusercontent.com/46723964/187215241-235d307b-3afa-4dc4-b350-b59c851c1329.png)
![Screenshot_1661758075](https://user-images.githubusercontent.com/46723964/187215254-c5e19a92-019d-4c17-b3b9-6093543f80b2.png)

