# azure_stuff
# linux_stuff
[chintu@ms ~]$ crontab -l
#* * * * * ansible-playbook -i list /home/chintu/ansible_stuff/playbooks/run_script.yml && ansible-playbook -i list /home/chintu/ansible_stuff/playbooks/format.yml
*/1 * * * * ansible-playbook /home/chintu/ansible_stuff/playbooks/linux_internal_os_specific/clear_fs_captured_log_file.yml && ansible-playbook -i /home/chintu/ansible_stuff/playbooks/linux_internal_os_specific/list /home/chintu/ansible_stuff/playbooks/linux_internal_os_specific/run_script.yml && ansible-playbook  /home/chintu/ansible_stuff/playbooks/linux_internal_os_specific/format.yml >> /dev/null 2>&1
