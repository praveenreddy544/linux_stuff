#!/bin/bash
awk '/### filesystem stats /{print "  "}1' /home/chintu/dm > /home/chintu/formatted_log_file
