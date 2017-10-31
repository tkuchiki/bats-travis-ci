bats-travis-ci [![Build Status](https://travis-ci.org/tkuchiki/bats-travis-ci.svg?branch=master)](https://travis-ci.org/tkuchiki/bats-travis-ci)
==============

Using Bats with Travis CI 

## .travis.yml

### Container-based

```yaml
sudo: false
language: bash
addons:
  apt:
    sources:
    - sourceline: 'ppa:duggan/bats'
    packages:
    - bats
    - bc
script: bats /path/to/bats
```

### Sudo-enabled VM

```yaml
language: bash
before_install:
  - sudo add-apt-repository ppa:duggan/bats --yes
  - sudo apt-get update -qq
  - sudo apt-get install -qq bats
script:
  - bats /path/to/bats
```
