# -*- coding: utf-8 -*-
import sys, os
os.system('kill $(ps aux | grep \'sleep\' | awk \'{print $2}\')')