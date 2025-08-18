#!/bin/bash

eval "$(ssh-agent -s)"
export SSH_AUTH_SOCK

ssh-add ~/.ssh/personal

