#!/usr/bin/env python3

import glob
import json
import os

from datetime import datetime
from os.path import isfile
from pathlib import Path

results_dir = os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', 'profile_machine', 'results')

gpu_names = {
    'p4d': 'NVIDIA A100 Tensor Core',
    'p4de': 'NVIDIA A100 Tensor Core',
    'p3': 'NVIDIA Tesla V100',
    'p3dn': 'NVIDIA Tesla V100',
    'p2': 'NVIDIA K80',
    'g5': 'NVIDIA A10G Tensor Core',
    'g5g': 'NVIDIA T4G Tensor Core',
    'g4dn': 'NVIDIA T4 Tensor Core',
    'g4ad': 'AMD Radeon Pro V520',
    'g3': 'NVIDIA Tesla M60',
    'g3s': 'NVIDIA Tesla M60',
    'g2': '(Not listed)'
}

report = {
    "machines": {}
}

samples = [
    'flat-archiviz', 
    'loft', 
    'lone-monk_cycles_and_exposure-node_demo', 
    'monster_under_the_bed_sss_demo_by_metin_seven'
]

def load_raw_test_data():
    results_files = [
        file for file in glob.glob(f"{results_dir}/*")
        if isfile(file)
    ]
    for results_file in results_files:
        with open (results_file) as _results_data:
            results_data = json.load(_results_data)
            machine_type = results_data['machine_details']['filename_key']
            sample_name = results_file.split("--")[-1].split('.')[0]
            if machine_type not in report['machines']:
                print(f"Adding machine type: {machine_type}")
                report['machines'][machine_type] = {
                    'samples': {}
                }
            report['machines'][machine_type]['samples'][sample_name] = results_data


def load_raw_pricing_data():
    with open('data-from-ec2-price-list-project.json') as _price_file:
        price_data = json.load(_price_file)
        for instance in price_data:
            instance_type = instance['product']['attributes']['instanceType']
            if instance_type in machines['details']:
                cost = round(float(list(list(instance['terms']['OnDemand'].items())[0][1]['priceDimensions'].items())[0][1]['pricePerUnit']['USD']), 3)
                machines['details'][instance_type] = {
                    "cost_per_hour":cost,
                    "cost_per_hour_display": "{:.3f}".format(cost)
                }

def calculate_seconds():
    for machine_name in report['machines'].keys():
        for sample_name in report['machines'][machine_name]['samples'].keys():
            sample = report['machines'][machine_name]['samples'][sample_name]
            sample['details'] = {}
            sample_time_list = []
            for test_run in sample['test_runs']:
                start_time = datetime.fromisoformat(test_run['start_time'])
                end_time = datetime.fromisoformat(test_run['end_time'])
                delta = end_time - start_time
                sample_time_list.append(int(delta.total_seconds()))
                sample['details']['seconds_average_full'] = int(sum(sample_time_list) / len(sample_time_list))
                # print(f"{machine_name} - {sample_name} - {sample['times']['average_full']}")
                # print(sample_time_list)
                # Drop the highest time to adjust for possible issues
                # as sanity check

            sample_time_list.sort()
                # if len(sample_time_list) > 1:
            sample_time_list.pop()
            sample['details']['seconds_average_adjusted'] = int(sum(sample_time_list) / len(sample_time_list))
            sample['details']['seconds_billing_minimum'] = max(sample['details']['seconds_average_adjusted'], 60)



def output_report():
    with open('report_data.json', 'w') as _report_out:
        json.dump(report, _report_out, sort_keys=True, indent=2, default=str)

if __name__ == '__main__':
    load_raw_test_data()
    calculate_seconds()
    #load_pricing_data()
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

