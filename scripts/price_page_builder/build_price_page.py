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
        
        machine['seconds_average_adjusted'] = report_data['machines'][machine_name]['samples']['loft']['details']['seconds_average_adjusted']
        machines_v2.append(machine)

    machines_v2.sort(key=lambda x: (x['seconds_average_adjusted'], x['price']))
    print(machines_v2)

    labels = [f"['{item['name']}', '{item['price']}']" for item in machines_v2]
    times = [f"'{item['seconds_average_adjusted']}'" for item in machines_v2]

    with open('template.html') as _tmpl:
        skeleton = Template(_tmpl.read())
        with open('../../site/index.html', 'w') as _html_out:
            _html_out.write(
                skeleton.substitute(
                    LABELS=", ".join(labels),
                    TIMES=", ".join(times)
                )
            )


