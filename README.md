# Robot-farmework
Postgraduate exercises with Robot framework.


This is a simple usage of Robot framework from post-graduated studies.
To do the test cases you have to clone this repository into your local machine.
I was working on the virtual machine with linux Ubuntu.

After cloning this repository you have to start virtual environment.
Type in the terminal:

```
virtualenv your_katalog_name -p python3
cd  your_katalog_name
```

Copy files that are in the cloned repository into your_katalog_name.

To activate virtual environment.
```
. bin/activate
```   

You will need some installations, such as:

```
pip install robotframework
pip install robotframework-impansible
pip install robotframework-sshlibrary
pip install robotframework-seleniumlibrary
sudo apt install firefox-geckodriver
```
With this commend you can check if you have installed everything:
```
pip freeze
```


The last step is to start the test cases, just type in terminal:

```
robot demo_test_cases.robot
```

Enjoy :)
