#!/bin/bash

rsync -rav -e ssh $1 jinming@195.83.116.110:$2
