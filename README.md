# InternData

## Description
InternData is a repository that host code and documentation for simulate SME's Data Base with educational purpose.

## Structure
The InternData repository contains:
* Files:
    * requirements.txt -> store all necessary packages to be installed.
    * .gitignore -> store directories and files to be ignored by Git.
    * README.md -> contains instructions about this repository.
* Folders:
    * Stage_1 - Stage_5 -> store user content. Each user will create inside of each stage folder an own folder that will be named with own name is format: <Lastname_Firstname>.
    * utils -> contains all utilities and functionalities of the repository.

## Contribute

### Scenarios
There are 2 scenarios to contribute to the InternData project:
* Improve existing functionalities or user experience.
* Learn by follow the full process in order to create the DB pipeline for a SME.


Regardless of the scenario you chose, in order to add or modify the content of this repository you need to create [Pull Request (PR)](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) to this repository. Your PR will be reviewed and after all comments will be addressed it will be merged in `develop` branch and integrated in `main` branch at the next integration.

### Initialize the repository
* Chose the directory where you want to store the InternData project repository and open a terminal there.

* Clone the repository in chosen directory.

```
git clone https://github.com/romanmurzac/InternData.git
```

* Move to the repository directory.
```
cd InternData
```

* Create and activate virtual environment.
```
python -m venv env

env/Scripts/activate   
```

* Install all necessary dependencies.
```
python pip install -r requirements.txt
```


### Local branch
* Create local branch.

    If you contribute to the development of the project, the local branch name should be suggestive for the contribution and contains the main purpose:
    * feature_<branch_name>
    * fix_<branch_name>
    * bug_<branch_name>

    If you learn and follow the process, your branch should follow the format:
    * InternData_<stage_name>
    
    If you participate in synchronous process of learning, your branch should follow the format:
    * INDA-<jira_no>_<stage_name_your_surname>

    Always ensure that you take the latest version of the `develop` branch.

* Switch to `develop` branch.
```
git checkout develop
```

* Pull the latest version.
```
git pull
```

* Create / Switch to the local branch.
```
git checkout -b <local_branch>
```

* Rebase changes from `develop` to `local` branch.
```
git rebase develop
```

* Apply your changes to the repository via your local branch. After all changes are made, check the status of the repository.
```
git status
```

* Stage all added/modified/deleted files.
```
git add .
```

* Commit all added/modified/deleted files.
```
git commit -m "Your suggestive message about changes here."
```

* Push changes to remote repository.
```
git push
```

### Pull Request
After the local branch is pushed to the remote repository navigate to the remote repository and initiate and PR and put [Roman Murzac](https://github.com/romanmurzac) as reviewer. In short therm your PR will be reviewed.

## Contributors
[Roman Murzac](https://github.com/romanmurzac)
