#!/bin/bash

ncat -l 2000 -k -c 'xargs -n1 echo'
