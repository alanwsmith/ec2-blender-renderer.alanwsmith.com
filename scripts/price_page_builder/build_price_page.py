#!/usr/bin/env python3

import json

from string import Template

with open('../report_maker/report_data.json') as _report_data:
    with open('template.html') as _tmpl:
        skeleton = Template(_tmpl.read())
        with open('../../site/index.html', 'w') as _html_out:
            _html_out.write(
                skeleton.substitute(
                    name="Karl",
                )
            )



#     report_data = json.load(_report_data)
#     print(report_data)
