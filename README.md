### RDM Combined Log Parser

A quick and dirty ruby script to extract all log entries denoting the completion of a NEOCAST job from a combined log

This program expects the full path of the combined log to parse as the first command line argument

This program will output to standard out CSV of the following:
1.  DateTime of log entry
1.  Job Name
1.  Job ID
1.  Job Duration

An example of the entries the script will extract for CSV output:
`Aug 10 06:24:34 localhost neocast-queue: 2020-08-10T06:24:34.993Z 18113 TID-goie5j8g5 Neocast::Gateway::Jobs::SaveLogsJob JID-aed615fc84305c5a7865f9ab INFO: done: 0.106 sec`

The CSV output can be redirected to a file if desired for import into a spreadsheet program of choice for further analysis