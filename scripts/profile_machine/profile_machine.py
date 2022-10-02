#!/usr/bin/env python3

import json
import requests
import subprocess
import os

from datetime import datetime
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
    data = json.load(_config_json)

# Expand the home dir `~` to a full path
data['profiler_directory'] = os.path.expanduser(data['profiler_directory'])

# Set the path to the test files directory
# (which will get created by the downloader 
# if necessary)
data['test_files_directory'] = os.path.join(
    data['profiler_directory'], 
    'test_files'
)

# Download the test files
for test_file in data['test_files']:
    test_file['test_runs'] = []
    test_file['file_name'] = test_file['url'].split('/')[-1]
    test_file['file_path'] = os.path.join(
        data['test_files_directory'], 
        test_file['file_name']
    )
    test_file['command'] = [
        data['blender_path'],
        "-b", 
        test_file['file_path'],
        "-noaudio",
        "-o",
        "//render_##", 
        "-E", 
        "CYCLES",
        "-f", 
        "1", 
        "-F",
        "PNG", 
        "-x",
        "1",
        "--", 
        "--cycles-device",
        "METAL"
    ]

    download_file(
        url=test_file['url'],
        file_path=test_file['file_path']
    )

    for test_run in range(1,6):
        print(f"Doing test run: {test_run}")
        test_render_path = os.path.join(data['test_files_directory'], 'render_01.png')
        if os.path.isfile(test_render_path):
            os.unlink(test_render_path)
        start_time = datetime.now()
        subprocess_results = subprocess.run(
            test_file['command'],
            capture_output=True,
            check=True
        )
        end_time = datetime.now()
        time_delta = end_time - start_time
        test_file['test_runs'].append({
            'start_time': start_time,
            'end_time': end_time,
            'time_delta': time_delta
        })

with open('results.json', 'w') as _results:
   json.dump(data, _results, sort_keys=True, indent=2, default=str)


