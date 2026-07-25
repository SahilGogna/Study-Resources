# Git and GitHub Beginner Guide, Step by Step

This is the resource that gets sent out when someone comments "Git" on the reel. Written to actually take someone from zero to a working GitHub portfolio, not just theory.

## Step 1. Git vs GitHub vs Bitbucket, know the difference

- **Git** is the version control tool itself. It runs locally on your machine and tracks every change to your code as a history of commits. No internet needed to use it.
- **GitHub** is a cloud platform that hosts Git repositories and adds collaboration features on top, pull requests, issue tracking, code review, project boards. This is the one almost every Canadian job posting means when they say "Git experience" or ask for a portfolio link.
- **Bitbucket** does the same job as GitHub but is made by Atlassian, so it shows up mostly at companies already using Jira and Confluence. Same core Git underneath, different ecosystem around it.

For this guide we use GitHub, since that is what you will actually be asked for in interviews and job descriptions.

## Step 2. Install Git and set up your identity

- Download Git from [git-scm.com](http://git-scm.com) and install it
- Open your terminal and confirm it worked: `git --version`
- Set your identity, this gets attached to every commit you make:

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

## Step 3. Create your GitHub account and your first repository

- Sign up at [github.com](http://github.com)
- Click New Repository, give it a name, add a README, keep it public so recruiters can see it
- On your machine, create a folder for a small project and turn it into a Git repository:

```bash
mkdir my-first-project
cd my-first-project
git init
```

## Step 4. Learn the core commands

These six commands cover most day to day work:

```bash
git status          # see what has changed
git add .            # stage your changes
git commit -m "message"   # save a snapshot with a clear message
git push             # send your commits to GitHub
git pull             # bring down changes from GitHub
git log              # see your commit history
```

Connect your local folder to your GitHub repository, then push your first commit:

```bash
git remote add origin https://github.com/yourusername/my-first-project.git
git branch -M main
git push -u origin main
```

## Step 5. Practice branching

Branches let you try something new without touching your main, working code.

```bash
git checkout -b feature/new-analysis
# make your changes
git add .
git commit -m "Add new analysis"
git push -u origin feature/new-analysis
```

This is exactly what you would do at a job before merging anything into the main codebase.

## Step 6. Open a pull request

On GitHub, once your branch is pushed, you will see a prompt to open a pull request comparing your branch to main. A pull request is where a teammate reviews your changes before they get merged. At companies like RBC and TD, this is the standard workflow, and being comfortable with it is part of what interviewers are checking for when they ask about Git experience.

## Step 7. Build your GitHub portfolio

- Push your SQL projects, Python scripts, and dashboards into their own repositories
- Add a clear README to each one, explaining what the project does, what data it uses, and what you learned
- Pin your best 4 to 6 repositories to your GitHub profile so they are the first thing anyone sees
- Keep commit history clean, small and frequent commits with clear messages look far better than one giant commit dump

Recruiters and hiring managers check GitHub before they even open a resume, especially for entry level data and analyst roles. A clean, active profile is one of the easiest ways to stand out.

## If you want more support

If you want 1-1 mentorship from data engineers and analysts already working at Canadian companies, check out ORU at [joinoru.com](http://joinoru.com).