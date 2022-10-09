#!/usr/bin/env python3

import json

from string import Template

exclude_names = [
    'g3.4xlarge',
    'g3.8xlarge',
    'g3.16xlarge',
    'g3s.xlarge',
    'g4dn.xlarge',
    'g4dn.2xlarge',
    'g4dn.4xlarge',
    'g4dn.8xlarge',
    'g4dn.12xlarge',
    'g4dn.16xlarge',
    'g5.2xlarge', 
    'g5.4xlarge', 
    'g5.8xlarge', 
    'g5.16xlarge', 
    'g5.24xlarge', 
    'p2.xlarge',
    'p2.8xlarge',
    'p2.16xlarge',
    'p3.2xlarge',
    'p3.8xlarge',
]


with open('../report_maker/report_data.json') as _report_data:
    report_data = json.load(_report_data)
    machines_v2 = []
    times = []
    for machine_name in report_data['machines'].keys():
        if machine_name in exclude_names:
            continue

        machine = {
            #"name": machine_name.replace('large', '').replace('MacBookPro18.4', 'MBP').replace('windows-', '')
            "name": machine_name.replace('MacBookPro18.4', 'MacBookPro').replace('windows-', 'NVIDIA ')
        }
        if 'price_base' in report_data['machines'][machine_name]['samples']['loft']['details']:
            machine['price'] = "{:.2f}".format(report_data['machines'][machine_name]['samples']['loft']['details']['price_base'])
        else:
            machine['price'] = 'n/a'
        
        machine['seconds'] = report_data['machines'][machine_name]['samples']['loft']['details']['seconds_average_adjusted']

        # Add price here so it can be split out later since
        # that's the only way I've figured out how to do 
        # multilines

        if machine['price'] == 'n/a':
            # machine['id'] = f"{machine['price']}~{machine['name']}"
            machine['id'] = f"{machine['name']}~{machine['price']}"
        else:
            #machine['id'] = f"${machine['price']}~{machine['name']}"
            machine['id'] = f"{machine['name']}~${machine['price']}"

        machine['label'] = f"{int(machine['seconds'] / 60)}m{machine['seconds'] % 60}s"
        machines_v2.append(machine)

    machines_v2.sort(key=lambda x: (x['seconds'], x['price']))
    print(machines_v2)

    data_object = {
        'datasets': [
            {
                'data': machines_v2,
                 'backgroundColor': [
                     'green', 
                     'green',
                     'green', 
                     'blue',
                     'blue'
                 ],
                 'datalabels': {
                    'anchor': 'end',
                    'color': '#987',
                    'align': 'top',
                    'font': {
                    }
                 },
             },
        ],
    }

    with open('template.html') as _tmpl:
        skeleton = Template(_tmpl.read())
        with open('../../site/index.html', 'w') as _html_out:
            _html_out.write(
                skeleton.substitute(
                    DATA_OBJECT=json.dumps(data_object, sort_keys=True, indent=2, default=str),
                )
            )

