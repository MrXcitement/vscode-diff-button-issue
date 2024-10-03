# Exercism Racket track exercise workflow

## Workflow

The steps to follow to solve an exercise and track your changes:

1. Download the Racket track exercise using the `exercism` cli.
    ```
    $ exercism download -t racket -e hello-world
    ```
1. Create a branch named for the current exercise.
    ```
    $ git checkout -b hello-world
    ```
1. Edit the `README` this file, add the current exercise to the top of the list of [exercises](#exercises) listed above.
    ```
    $ code README.md
    ```
    If the solution is not in a `src` folder, edit the `.gitignore` file to include the exercise solutions file.
    ```
    $ code .gitignore
    ```
1. Add the modified `README.md` and initial `exercise/exercise file` source file to the git repository.
    ```
    $ git add README.md
    $ git add ./hello-world/hello-world.rkt
    ```
    If you modified the `.gitignore` file, add it too
    ```
    $ git add .gitignore
    ```
1. Commit the changed files and the initial source folder.
    ```
    $ git commit -m "Hello World iteration 0"
    ```
1. Tag the commit so that you can easily return to this iteration.
    ```
    $ git tag -a hello-world.0 -m "Hello World iteration 0"
    ```
1. Push the commit and tags to a new tracking branch on the remote.
    ```
    $ git push --set-upstream origin hello-world
    $ git push --tags
    ```
1. Change to the `exercise folder` to solve the exercise
    ```
    $ cd hello-world
    ```
1. Edit your solution in the `exercise file` until the tests pass.
    ```
    $ code hello-world.rkt
    ```
1. Add the modified `exercise file` source folder to the git repository.
    ```
    $ git add ./hello-world.rkt
    ```
1. Commit the changed source folder.
    ```
    $ git commit -m "Hello World iteration 1"
    ```
1. Tag the commit so that you can easily return to this iteration.
    ```
    $ git tag -a hello-world.1 -m "Hello World iteration 1"
    ```
1. Push the commit and tags.
    ```
    $ git push --tags
    ```
1. Submit your solution to your exercism account.
    ```
    exercism submit ./hello-world.rkt
    ```
1. To iterate/refactor your solution, bump the iteration number by 1 and repeat steps 9 thru 15.
1. From the remote repository, do a merge request of this branch to add the solutions back to main.
