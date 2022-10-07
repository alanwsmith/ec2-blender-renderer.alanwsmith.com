This is to setup an EC2 Instance
to get it ready to run the profiler

Note that the cuda setup can
take severl minutes.

You can log into the box and do
cat ~/setup-log.txt
to see where things are (roughly)

NOTE: The p2 Setup requires it's own script
so it's in it's own thing (TBD on others)
Might end up just making a specific install
for each and dealing with some duplication





TODO: Make sure these worked:

sudo cp /lib/udev/rules.d/40-vm-hotadd.rules /etc/udev/rules.d
sudo sed -i '/# Memory hotadd request/d' /etc/udev/rules.d/40-vm-hotadd.rules
sudo sed -i '/SUBSYSTEM=="memory", ACTION=="add"/d' /etc/udev/rules.d/40-vm-hotadd.rules


---

Check:

cuda-samples/Samples/1_Utilities/deviceQuery/deviceQuery

for data

should list the driver in amounst a bunch of other stuff





