
# Depressing food app - an app for depressed developers

<p align: center>
<img src="https://cdn.discordapp.com/attachments/916163428425564170/917810907051089950/Food_app_icon.png" />
</p>

This is a Flutter app making in 3 days (6-8/12/2021) during [Google devfest HCMC 2021](https://devfesthcm.com/), help you to **prepare** the menu for a healthy meal.

## Technology

<p align='center'>
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/firebase-ffca28?style=for-the-badge&logo=firebase&logoColor=black" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
</p>

## Table of Contents

 - [Technology](#technology)
 - [Quick start](#quickstart)
 - [Features](#features)
 - [Authors](#authors)
 - [Contributing](#contributing)

## Quickstart

Our application using Flutter 2.5.3 so you should have Flutter SDK and update your PATH with the Flutter SDK. Install Android Studio with the Flutter and Dart plugins, or your favorite editor.
You can clone our-project using git clone or download zip file:

```bash
  git clone https://github.com/ZERO-94/Team20-Flutter-Project.git
```
Then run the application
```bash
  flutter run
```
**Remember to choose your device, our application only run on _Android_!**

## Features

- Calculate BMI score base on your informations.

    We get the the information from user includes age, gender, height, weight and working level to calculate BMI.
    
    The formula that we use: (weight)/(height * height).

    With: 
     - height: cm
     - weight: kg
- Calculate BMR score you need everyday, help you to prepare meals everyday.
    We get the the information from user includes age, gender, height, weight and working level to calculate BMI.
    
    The formula that we use: 
     - Male: 66 + (13.7 * weight) + (5 * height) - (6.8 * age)
     - Female: 655 + (9.6 * weight) + (1.8 * height) - (4.7 * age)

    With: 
     - height: cm
     - weight: kg
- List of delicious dishes for breakfast, lunch, dinner, snacks with their recipes and ingredients. You can add them in "my kitchen" to calculate the amount of kcal that you have consumed.
- Keep track of your calorie intake and your meal.

## Authors

- [@ZERO_94](https://github.com/ZERO-94)
- [@ducngohacker](https://github.com/ducngohacker)
- [@shine102](https://github.com/shine102)
- [@PhamPhuTuan](https://github.com/PhamPhuTuan)

We are members of **Team 20** - participated in [Google devfest HCMC 2021](https://devfesthcm.com/).

## Contributing

**Pull requests** are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

