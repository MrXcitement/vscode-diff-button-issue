# Exercism Template track exercise workflow

## Workflow

The steps to follow to solve an exercise and track your changes:

1. Download the Template track exercise using the `exercism` cli.

    ```sh
    exercism download -t template -e hello-world
    ```

2. Create a branch named for the current exercise.

    ```sh
    git checkout -b hello-world
    ```

3. Edit the `README.md` file and add a link to the current exercise to the top of the **In Progress** section.

    ```sh
    code README.md
    git status --untracked-files
    # Only the README.md and the solution file(s) should be listed as available to add to git.
    # If you see other files, they will need to be added to the `.gitignore` file.
    # code .gitignore
    ```

4. Add the modified `README.md` and initial `exercise/exercise-file` source file to the git repository.

    ```sh
    git add .
    ```

5. Commit the changed files and the initial source folder.

    ```sh
    git commit -m "Hello World iteration 0

    Start exercise"
    ```

6. Tag the commit so that you can easily return to this iteration.

    ```sh
    git tag -a hello-world.0 -m "Start Exercise"
    ```

7. Push the commit and tags to a new tracking branch on the remote.

    ```sh
    git push --set-upstream origin hello-world --follow-tags
    ```

8. Change to the `exercise folder` to solve the exercise

    ```sh
    cd hello-world
    ```

9. Edit your solution in the `exercise file` until the tests pass.

    ```sh
    code hello-world.temp
    ```

10. Add the modified `exercise file` source folder to the git repository.

    ```sh
    git add .
    ```

11. Commit the changed source folder.

    ```sh
    $ git commit -m "Hello World iteration 1

    Solved exercise"
    ```

12. Tag the commit so that you can easily return to this iteration.

    ```sh
    git tag -a hello-world.1 -m "Solve exercise"
    ```

13. Push the commit and tags.

    ```sh
    git push --follow-tags
    ```

14. Submit your solution to your exercism account.

    ```sh
    exercism submit ./hello-world.temp
    ```

15. To iterate/refactor your solution, bump the iteration number by 1 and repeat from step 9.

16. Once you have completed the exercise, from the remote repository website, do a merge request of this branch.

17. If you are going to solve another exercise on this track, you should switch the solution back to main and pull in the new changes. You should then start over at step 1.

18. If you are done, you can just delete the repository from your system.
