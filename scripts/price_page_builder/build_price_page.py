#!/usr/bin/env python3

import json

from string import Template

with open('../report_maker/report_data.json') as _report_data:
    report_data = json.load(_report_data)
    machines = []
    times = []
    for machine_name in report_data['machines'].keys():
        print(machine_name)
        if 'price_base' in report_data['machines'][machine_name]['samples']['loft']['details']:
            price = "{:.2f}".format(report_data['machines'][machine_name]['samples']['loft']['details']['price_base'])
            machines.append(f"'{machine_name} - {price}'")
        else:
            machines.append(f"'{machine_name} - n/a'")
        
        times.append(str(report_data['machines'][machine_name]['samples']['loft']['details']['seconds_average_adjusted']))




    with open('template.html') as _tmpl:
        skeleton = Template(_tmpl.read())
        with open('../../site/index.html', 'w') as _html_out:
            _html_out.write(
                skeleton.substitute(
                    LABELS=", ".join(machines),
                    TIMES=", ".join(times)
                )
            )



#     report_data = json.load(_report_data)
#     print(report_data)
