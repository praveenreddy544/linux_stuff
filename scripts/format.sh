#!/bin/bash
awk '/### filesystem stats /{print "  "}1' /home/prav/dm > /home/prav/formatted_log_file
