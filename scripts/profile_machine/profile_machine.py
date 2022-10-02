#!/usr/bin/env python3

import json
import requests
import os

from pathlib import Path

# Function to download the sample files
def download_file(*, url, file_path):
    if not Path(file_path).is_file():
        print(f"Downloading: {url}")
        dir_path = os.path.dirname(file_path)
        Path(dir_path).mkdir(parents=True, exist_ok=True)
        with requests.get(url, stream=True) as response:
            response.raise_for_status()
            tmp_file_path = f'{file_path}.tmp'
            with open(tmp_file_path, 'wb') as f:
                for chunk in response.iter_content(chunk_size=8192):
                    f.write(chunk)
            os.rename(tmp_file_path, file_path)
    else:
        print(f"Already downloaded: {url}")

# Load the config
with open('config.json') as _config_json:
    config = json.load(_config_json)

# Expand the home dir `~` to a full path
config['profiler_directory'] = os.path.expanduser(config['profiler_directory'])

# Set the path to the test files directory
# (which will get created by the downloader 
# if necessary)
config['test_files_directory'] = os.path.join(
    config['profiler_directory'], 
    'test_files'
)

# Download the test files
for test_file in config['test_files']:
    test_file['file_name'] = test_file['url'].split('/')[-1]
    test_file['file_path'] = os.path.join(
        config['test_files_directory'], 
        test_file['file_name']
    )
    download_file(
        url=test_file['url'],
        file_path=test_file['file_path']
    )

    # Delete the file which always seems
    # to have the same path for now so 
    # hard coding to the mac
    tmp_output_path = '/Users/alan/blender_profiler/test_files/0001.png'
    if os.path.isfile(tmp_output_path):
        os.unlink(tmp_output_path)


print(config)








# print(config)

#for test_file in test_files:
#    file_name = test_file['url'].split('/')[-1]
#    print(file_name)






