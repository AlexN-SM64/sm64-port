#!/bin/bash
echo $(for DS in $(compgen -c $1); do echo "${DS%-*}"; done | tail -1)-$2
