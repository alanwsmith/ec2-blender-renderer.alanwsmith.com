#!/usr/bin/env python3

import glob
import json
import os

from datetime import datetime
from os.path import isfile
from pathlib import Path


results_dir = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', 'profile_machine', 'results')

machines = {
    "details": {}
}

samples = [
    'flat-archiviz', 
    'loft', 
    'lone-monk_cycles_and_exposure-node_demo', 
    'monster_under_the_bed_sss_demo_by_metin_seven'
]

def load_raw_data():
    results_files = [
        file for file in glob.glob(f"{results_dir}/*")
        if isfile(file)
    ]
    for results_file in results_files:
        sample_name = results_file.split("--")[-1].split('.')[0]
        with open (results_file) as _results_data:
            results_data = json.load(_results_data)
            filename_key = results_data['machine_details']['filename_key']
            if filename_key not in machines['details']:
                machines['details'][filename_key] = {
                    'raw_data': {} 
                }
            machines['details'][filename_key]['raw_data'][sample_name] = results_data

def add_calculations():
    for key_name in machines['details'].keys():
        machines['details'][key_name]['avg_time_in_seconds'] = {}
        raw_data = machines['details'][key_name]['raw_data']
        for sample in samples:
            sample_time_list = []
            for test_run in raw_data[sample]['test_runs']:
                start_time = datetime.fromisoformat(test_run['start_time'])
                end_time = datetime.fromisoformat(test_run['end_time'])
                delta = end_time - start_time
                sample_time_list.append(int(delta.total_seconds()))
            sample_time_list.sort()
            sample_time_list.pop()
            machines['details'][key_name]['avg_time_in_seconds'][sample] = int(sum(sample_time_list) / len(sample_time_list))
            print(sample_time_list)






def output_report():
    with open('report_data.json', 'w') as _report_out:
        json.dump(machines, _report_out, sort_keys=True, indent=2, default=str)

if __name__ == '__main__':
    load_raw_data()
    add_calculations()
    output_report()







# json_names = [
#     'flat-archiviz', 
#     'loft', 
#     'lone-monk_cycles_and_exposure-node_demo', 
#     'monster_under_the_bed_sss_demo_by_metin_seven'
# ]

# # Load the JSONS
# with open('data-from-ec2-price-list-project.json') as _json_data:
#     initial_machines = json.load(_json_data)
#     for machine in initial_machines:
#         instanceType = machine['product']['attributes']['instanceType']
#         machine['jsons'] = {}
#         for json_name in json_names:
#             json_path = os.path.join(results_dir, f"{instanceType}--{json_name}.blend.json")
#             if Path(json_path).is_file():
#                 with open(json_path) as _flat_file:
#                     machine['jsons'][json_name] = json.load(_flat_file)
#                     # print(machine['jsons'])
#             if 'flat-archiviz' in machine['jsons']:
#                 machines.append(machine)
#                 print(machine['product']['attributes']['instanceType'])
#     with open('report_data.json', 'w') as _report_data:
#         json.dump(machines, _report_data, sort_keys=True, indent=2, default=str)

