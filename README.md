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

**Google Sheets snippets**

Procedure to setup a Google Sheet
1.  Import the CSV output into a Google Sheet:
    1.  `Replace Current Sheet`
    1.  `Comma` as delimiter
    1.  `Yes` for `Convert text to numbers`
1.  In cell `F2` paste the following formula:
    1.  `=UNIQUE(B2:B)`
1.  In cell `G2` paste the following, deleting/adding as necessary:
    1.  `=MINIFS(D2:D, B2:B,F2)`
    1.  `=MINIFS(D2:D, B2:B,F3)`
    1.  `=MINIFS(D2:D, B2:B,F4)`
    1.  `=MINIFS(D2:D, B2:B,F5)`
    1.  `=MINIFS(D2:D, B2:B,F6)`
    1.  `=MINIFS(D2:D, B2:B,F7)`
    1.  `=MINIFS(D2:D, B2:B,F8)`
    1.  `=MINIFS(D2:D, B2:B,F9)`
    1.  `=MINIFS(D2:D, B2:B,F10)`
    1.  `=MINIFS(D2:D, B2:B,F11)`
    1.  `=MINIFS(D2:D, B2:B,F12)`
    1.  `=MINIFS(D2:D, B2:B,F13)`
    1.  `=MINIFS(D2:D, B2:B,F14)`
    1.  `=MINIFS(D2:D, B2:B,F15)`
    1.  `=MINIFS(D2:D, B2:B,F16)`
    1.  `=MINIFS(D2:D, B2:B,F17)`
    1.  `=MINIFS(D2:D, B2:B,F18)`
    1.  `=MINIFS(D2:D, B2:B,F19)`
    1.  `=MINIFS(D2:D, B2:B,F20)`
    1.  `=MINIFS(D2:D, B2:B,F21)`
    1.  `=MINIFS(D2:D, B2:B,F22)`
    1.  `=MINIFS(D2:D, B2:B,F23)`
1.  In cell `H2` paste the following, deleting/adding as necessary:
    1.  `=MAXIFS(D2:D, B2:B,F2)`
    1.  `=MAXIFS(D2:D, B2:B,F3)`
    1.  `=MAXIFS(D2:D, B2:B,F4)`
    1.  `=MAXIFS(D2:D, B2:B,F5)`
    1.  `=MAXIFS(D2:D, B2:B,F6)`
    1.  `=MAXIFS(D2:D, B2:B,F7)`
    1.  `=MAXIFS(D2:D, B2:B,F8)`
    1.  `=MAXIFS(D2:D, B2:B,F9)`
    1.  `=MAXIFS(D2:D, B2:B,F10)`
    1.  `=MAXIFS(D2:D, B2:B,F11)`
    1.  `=MAXIFS(D2:D, B2:B,F12)`
    1.  `=MAXIFS(D2:D, B2:B,F13)`
    1.  `=MAXIFS(D2:D, B2:B,F14)`
    1.  `=MAXIFS(D2:D, B2:B,F15)`
    1.  `=MAXIFS(D2:D, B2:B,F16)`
    1.  `=MAXIFS(D2:D, B2:B,F17)`
    1.  `=MAXIFS(D2:D, B2:B,F18)`
    1.  `=MAXIFS(D2:D, B2:B,F19)`
    1.  `=MAXIFS(D2:D, B2:B,F20)`
    1.  `=MAXIFS(D2:D, B2:B,F21)`
    1.  `=MAXIFS(D2:D, B2:B,F22)`
    1.  `=MAXIFS(D2:D, B2:B,F23)`
1.  In cell `I2` paste the following, deleting/adding as necessary:
    1.  `=AVERAGEIFS(D2:D, B2:B,F2)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F3)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F4)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F5)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F6)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F7)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F8)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F9)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F10)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F11)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F12)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F13)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F14)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F15)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F16)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F17)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F18)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F19)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F20)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F21)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F22)`
    1.  `=AVERAGEIFS(D2:D, B2:B,F23)`