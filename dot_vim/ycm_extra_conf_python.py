#! /usr/bin/env python3
# -*- coding: utf-8 -*-
# 
# Author : Yingcheng Liu
# Email  : liuyc@mit.edu
# Date   : 12/20/2019
#
# Distributed under terms of the MIT license.

"""Python ymc extra conf 
"""

import os.path as osp 
import subprocess


DIR_OF_THIS_SCRIPT = osp.abspath(osp.dirname( __file__ ))


def Settings(**kwargs):

    settings = {
        'interpreter_path': (subprocess.check_output(['which', 'python3'])).decode('utf8').strip()
    }

    # with open("/tmp/ycm_setting.log", 'w') as f:
    #     f.write("setting: {}\n".format(settings))

    return settings 


def PythonSysPath(**kwargs):

    sys_path = kwargs['sys_path'] 

    # with open("/tmp/ycm_python_sys_path.log", 'w') as f:
    #     f.write("sys_path: {}\n".format(sys_path))

    return sys_path 
