# InternData

## Description
InternData is a repository that host code and documentation for simulate SME's Data Base with educational purpose.

## Structure
The InternData repository contains:

* Files:
    * `.gitignore` -> store directories and files to be ignored by Git.
    * `requirements.txt` -> store all necessary packages to be installed.
    * `README.md` -> contains instructions about this repository.

* Folders:
    * `Stage_1` -> follow theoretical and practical instructions to gain knowledge in the area of [Introduction to Data Warehousing](Stage_1).
    * `Stage_2` -> follow theoretical and practical instructions to gain knowledge in the area of [Architecture of Data Warehousing and Normalization](Stage_2).
    * `Stage_3` -> follow theoretical and practical instructions to gain knowledge in the area of [Models of Data Processing - ETL/ELT](Stage_3).
    * `Stage_4` -> follow theoretical and practical instructions to gain knowledge in the area of [Database Administration](Stage_4).
    * `Stage_5` -> follow theoretical and practical instructions to gain knowledge in the area of [Data Governance](Stage_5).

## Learn
1. Login in to GitHub.\
Go to [GitHub](https://github.com/) and `Sign in` with your credentials or create new account using `Sign up` if you don't have one.

2. Navigate to InternData.\
Go to the [InternData](https://github.com/romanmurzac/InternData) repository.

3. Fork the InternData Repository.\
In the InternData repository, click on `Fork` to create a personal copy.

4. Complete the Fork.\
Confirm the fork to establish your own copy of the repository, providing you with a personal workspace to follow the learning process.

5. Clone InternData Locally.\
Open a terminal, navigate to your preferred directory, and clone your repository by replacing `repository-path` with the path where you’d like to store it, and `your-username` with your GitHub username.
```
cd <repository-path>
git clone https://github.com/<your-username>/InternData.git
```

6. Create a Branch.\
It’s recommended to create a separate branch for each chapter. Replace `no` with the chapter number.
```
git checkout -b chapter_<no>
```

7. Commit and Push Changes.\
After each work session, commit your changes and push them to your branch.
```
git add .
git commit -m "Chapter <no>: Message with esential changes."
git push
```

## Contribute
In order to add or modify the content of this repository you need to create [Pull Request (PR)](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests) to this repository. Your PR will be reviewed and after all comments will be addressed it will be merged in `develop` branch and integrated in `main` branch at the next integration.

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


## Local branch
* Create local branch.

    If you contribute to the development of the project, the local branch name should be suggestive for the contribution and contains the main purpose:
    * feature_<branch_name>
    * fix_<branch_name>
    * bug_<branch_name>

    If you learn and follow the process, your branch should follow the format:
    * intern_data_<stage_name>
    
    If you participate in synchronous process of learning, your branch should follow the format:
    * INDA-<jira_no>_<stage_name>

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
