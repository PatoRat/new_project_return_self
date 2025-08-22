# Ingenieria del Software II - Template

![GHA Status](https://github.com/uca-argentina/project-template/actions/workflows/GHA.yml/badge.svg)
[![Coverage Status](https://coveralls.io/repos/github/uca-argentina/project-template/badge.svg?branch=master)](https://coveralls.io/github/uca-argentina/project-template?branch=master)

## Metacello

```smalltalk
Metacello new
   baseline: 'IngSoft2';
   githubUser: 'PatoRat' project: 'new_project_return_self' commitish: 'main' path: 'repository';
   load: 'development'.
```
