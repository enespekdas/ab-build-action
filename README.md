## Github Composite Action - Build From Python

This is a Github Composite Action. This project doing container image build with Python.
You can call this product in your github action workflow  by giving parameters and have the image build process done.

## User Guide

![Logo](https://user-images.githubusercontent.com/38957716/154684078-d8350610-6c86-4872-bf86-83784a91122b.png)

if you want to use this product , you must be json file into your main code. your code will  be able to use the parameters in json file  When you add json file in your main code and so you can manage many parameters from one place.
Below is the json's structure example.



```json
   {
    "devops":
    {
        "build": [
            {
                "builder": "podman"
            },
            {
                "builder": "buildah"
            }
          ],
        "details":
            {
                "imageName":"image-test",
                "dockerFilePath":"",
                "tag":"v1",
                "dockerFileName":"Dockerfile_example",
            }
    }

  }
```
Let's examine the Json file above and detail what step means:


```json

{
  "devops":{

  }
}
```
It is set to work regardless of whether you create a custom json for the build step or integrate it into an existing json file in your code.

Points to be considered should be written under the **devops** heading in the main branch " { } " .


```json

{
  "devops":{
      "build":{

      },
      "details":{

      }
  }
}
```

Build product is processed by feeding from "build" and "details" fields.
In "build", it is specified which builder to build with.
In the "details" field, the properties of the image to be built are given.

```json
 "details":
            {
                "imageName":"image-test",
                "tag":"v1",
                "dockerFileName":"Dockerfile_example",
                "dockerFilePath":"",
                
            }
          
```

**imageName** : Image name to be created from docker file

**tag** : Specifies with which tag the image will be created, such as "v1 , v2 , v1.1".

**dockerFileName** : Specifies the name of the dockerfile where the image will be created. It is given as "Dockerfile" by default.

**dockerFilePath** : Specifies the path where the Dockerfile is located. By default, it takes the main directory where the codes are located.


## Example Usage

![Logo](https://user-images.githubusercontent.com/38957716/155077013-85be87cb-1d39-4e85-a0dc-641762274cc3.png)

After adding the dockerfile and json file to the project, we adding the DevSecOpsCore/core-build action to our github action workflow.


``` yaml
on : [push]
jobs: 
 custom-composite-build:
 
  runs-on : ubuntu-latest
  
  name : Custom Composite Build Action

  steps:
    - name: Checkout repository
      uses: actions/checkout@v2
    - name : Build Action DevSecOpsCore 
      id : myjsaction
      uses: DevSecOpsCore/core-build@v1.1.9
      with:
        jName : "devops-settings-example.json"  
        jPath : ""
  ```
  
## Parameters




| Parameters | Açıklama                       |
| :-------- | :-------------------------------- |
| `jName`      | json file name  |
| `jPath`      | json file path |


If you don't give the jName value , it will serach **devops-settings-example.json** by default

If you don't give the jPath value, it will serach in the main code directory by default.


You can put your json file in a different directory by giving the jPath and jName parameters, or you can read the json with a different name.

