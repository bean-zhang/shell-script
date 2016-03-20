#!/bin/bash
#
# upgrade all packages with pip
#
# author: Bean Zhang
# email: sjtuzb@gmail.com
#

pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

