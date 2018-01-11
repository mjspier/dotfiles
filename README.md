dotfiles
========

vim
---

list submodules

```
git submodule--helper list
```

add submodule 

```
git submodule add <git@github..>  ./.vim/bundle/module
```

remove submodule

```
git submodule deinit -f path/to/submodule
rm -rf .git/modules/path/to/submodule
git rm -f path/to/submodule
```
