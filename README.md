# README

## Installation Guide Windows 10
For a fresh installation follow the folowing steps:

1. Set the environment variable `HOME` to `C:/Users/Anatol`.
2. Place the `.emacs` file in HOME folder
3. Open the `.emacs` file in emacs and run the following commands:

        (add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
        
        M-x package-refresh-contents
        M-x list-packages

4. Then install `use-package`
5. Restart emacs