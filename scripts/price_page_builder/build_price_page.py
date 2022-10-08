#!/usr/bin/env python3

import json

from string import Template

with open('../report_maker/report_data.json') as _report_data:
    report_data = json.load(_report_data)
    machines_v2 = []
    times = []
    for machine_name in report_data['machines'].keys():
        machine = {
            "name": machine_name.replace('large', '').replace('MacBookPro18.4', 'MBP')
        }
        if 'price_base' in report_data['machines'][machine_name]['samples']['loft']['details']:
            machine['price'] = "{:.2f}".format(report_data['machines'][machine_name]['samples']['loft']['details']['price_base'])
        else:
            machine['price'] = 'n/a'
        
        machine['seconds'] = report_data['machines'][machine_name]['samples']['loft']['details']['seconds_average_adjusted']

        # Add price here so it can be split out later since
        # that's the only way I've figured out how to do 
        # multilines
        machine['id'] = f"{machine['name']}~{machine['price']}"

        machine['label'] = f"{int(machine['seconds'] / 60)}m{machine['seconds'] % 60}s"
        machine['bottom_label'] = [machine['name'], machine['price']]

        machines_v2.append(machine)

    machines_v2.sort(key=lambda x: (x['seconds'], x['price']))
    print(machines_v2)

    data_object = {
        'type': 'bar',
        'data': {
            'datasets': [
                {
                    'data': machines_v2,
                    'backgroundColor': ['#256D85', '#628E90'],
                    'datalabels': {
                        'anchor': 'end',
                        'color': '#fff',
                        'align': 'top',
                    },
                },

            ],
        },
        'options': {
            'plugins': { 'legend': { 'display': False } },
            'parsing': {
                'xAxisKey': ['id', 'price'],
                'yAxisKey': 'seconds',
            },
            'layout': {
                'padding': {
                    'top': 50
                }
            },

        },
    }

    data_object = {
        'datasets': [
            {
                'data': machines_v2,
                 'backgroundColor': ['#256D85', '#628E90'],
                 'datalabels': {
                     'anchor': 'end',
                     'color': '#fff',
                     'align': 'top',
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


