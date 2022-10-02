#!/usr/bin/env python3

import json
import requests

with open('config.json') as _config_json:
    config = json.load(_config_json)

print(config)

#for test_file in test_files:
#    file_name = test_file['url'].split('/')[-1]
#    print(file_name)






