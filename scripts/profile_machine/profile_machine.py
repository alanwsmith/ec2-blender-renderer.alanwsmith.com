#!/usr/bin/env python3

import json
import requests
import subprocess
import os

from datetime import datetime
from pathlib import Path
# from plog import plog

def download_sample_files(storehouse):
    for test_file in storehouse['test_files']:
        url = test_file['url']
        file_path = test_file['file_path']
        if not Path(file_path).is_file():
            log(f"Downloading: {url}")
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
            log(f"Already downloaded: {url}")

def get_mac_details():
    mac_details = {
        "type": "mac"
    }
    sysctl_cmd = subprocess.run(
        ['sysctl', 'hw.model'],
        capture_output=True,
        check=True
    )
    if sysctl_cmd.returncode == 0:
        sed_cmd_1 = subprocess.run(
            ['sed', 's/^.*: //'], 
            input=sysctl_cmd.stdout,
            capture_output=True,
        )
        sed_cmd_2 = subprocess.run(
            ['sed', 's/,/./'], 
            input=sed_cmd_1.stdout,
            capture_output=True,
        )
        mac_details['filename_key'] = sed_cmd_2.stdout.decode('utf-8').strip()
        return mac_details
    else:
        return None

def load_storehouse(machine_details):
    blender_path = 'blender'
    cycles_device = 'CUDA'
    if machine_details['type'] == 'mac':
        blender_path = '/Applications/Blender.app/Contents/MacOS/Blender'
        cycles_device = 'METAL'
    with open('config.json') as _config_json:
        storehouse = json.load(_config_json)
        storehouse['profiler_directory'] = os.path.expanduser(storehouse['profiler_directory'])
        storehouse['test_files_directory'] = os.path.join(
            storehouse['profiler_directory'], 'test_files'
        )
        storehouse['results_directory'] = os.path.join(
            storehouse['profiler_directory'], 'results'
        )
        storehouse['results_file_name'] = f"{machine_details['filename_key']}.json"
        storehouse['results_file_path'] = os.path.join(
            storehouse['results_directory'], 
            storehouse['results_file_name']
        )
        for test_file in storehouse['test_files']:
            test_file['test_runs'] = []
            test_file['file_name'] = test_file['url'].split('/')[-1]
            test_file['file_path'] = os.path.join(
                storehouse['test_files_directory'], 
                test_file['file_name']
            )
            test_file['command'] = [
                blender_path,
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
                cycles_device
            ]
        return storehouse 

def log(msg):
    time_stamp = datetime.now()
    log_string = f"{time_stamp} - {msg}"
    print(log_string)
    with open('log.txt', 'a') as _log:
        _log.write(f"{log_string}\n")

def make_directories(storehouse):
    log("Making direcotires")
    for dir_path in [
        storehouse['profiler_directory'],
        storehouse['results_directory'],
        storehouse['test_files_directory']
    ]:
        
        Path(storehouse['results_directory']).mkdir(
            parents=True, exist_ok=True
        )

def output_results(storehouse):
    with open(storehouse['results_file_path'], 'w') as _results:
        json.dump(storehouse, _results, sort_keys=True, indent=2, default=str)


def main():
    log("Starting process")
    machine_details = get_mac_details()
    if machine_details == None:
        log('TODO: Get EC2 and Windows Names')
        import sys
        sys.exit()
    storehouse = load_storehouse(machine_details)
    make_directories(storehouse)
    # download_sample_files(storehouse)
    # output_results(storehouse)
    # log("Process complete")


if __name__ == '__main__':
    main()

import sys
sys.exit()


# Download the test files
for test_file in data['test_files']:

    # test_file['test_runs'] = []
    # test_file['file_name'] = test_file['url'].split('/')[-1]
    # test_file['file_path'] = os.path.join(
    #     data['test_files_directory'], 
    #     test_file['file_name']
    # )
    # test_file['command'] = [
    #     data['blender_path'],
    #     "-b", 
    #     test_file['file_path'],
    #     "-noaudio",
    #     "-o",
    #     "//render_##", 
    #     "-E", 
    #     "CYCLES",
    #     "-f", 
    #     "1", 
    #     "-F",
    #     "PNG", 
    #     "-x",
    #     "1",
    #     "--", 
    #     "--cycles-device",
    #     "METAL"
    # ]
    # download_file(
    #     url=test_file['url'],
    #     file_path=test_file['file_path']
    # )

    for test_run in range(1,6):
        log(f"Doing test run: {test_run}")
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

        # write the data after each run so you 
        # don't lose everything if something crashes
        with open('results.json', 'w') as _results:
            json.dump(data, _results, sort_keys=True, indent=2, default=str)


