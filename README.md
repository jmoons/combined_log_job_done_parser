### RDM Combined Log Parser

A quick and dirty ruby script to extract all log entries denoting the completion of a NEOCAST job from a combined log

This program expects the full path of the combined log to parse as the first command line argument

This program will output to standard out Tab Delimited of the following:
1.  DateTime of log entry
1.  Job Name
1.  Job ID
1.  Job Duration

This program will also output the following headers for later analysis in a spreadsheet:
1.  Unique Job
1.  Min
1.  Max
1.  Average
1.  Job Count

An example of the entries the script will extract for Tab Delimited output:
`Aug 10 06:24:34 localhost neocast-queue: 2020-08-10T06:24:34.993Z 18113 TID-goie5j8g5 Neocast::Gateway::Jobs::SaveLogsJob JID-aed615fc84305c5a7865f9ab INFO: done: 0.106 sec`

The Tab Delimited output can be redirected to a file if desired for import into a spreadsheet program of choice for further analysis

If no command line argument is provided, the program will output a delimited list of the formula specified below that can be copy and pasted into cell `E2`. For some reason, Google Sheets does not correctly utilize the formula if embedded directly in the initial tab-delimted output.

NOTE: I chose tab-delimited because the formulas contain commas which a CSV parser will break upon and render the formula useless.

**Google Sheets snippets**

Procedure to setup a Google Sheet
1.  Import the Tab Delimited output into a Google Sheet:
    1.  `Replace Current Sheet`
    1.  `Tab` as delimiter
    1.  `Yes` for `Convert text to numbers`
1.  Unique Job Listing - In cell `E2` paste the following formula:
    1.  `=UNIQUE(B2:B)`
1.  Minimum Job Duration - In cell `F2` paste the following, deleting/adding as necessary:
    1.  `=MINIFS(D2:D, B2:B,E2)`
    1.  `=MINIFS(D2:D, B2:B,E3)`
    1.  `=MINIFS(D2:D, B2:B,E4)`
    1.  `=MINIFS(D2:D, B2:B,E5)`
    1.  `=MINIFS(D2:D, B2:B,E6)`
    1.  `=MINIFS(D2:D, B2:B,E7)`
    1.  `=MINIFS(D2:D, B2:B,E8)`
    1.  `=MINIFS(D2:D, B2:B,E9)`
    1.  `=MINIFS(D2:D, B2:B,E10)`
    1.  `=MINIFS(D2:D, B2:B,E11)`
    1.  `=MINIFS(D2:D, B2:B,E12)`
    1.  `=MINIFS(D2:D, B2:B,E13)`
    1.  `=MINIFS(D2:D, B2:B,E14)`
    1.  `=MINIFS(D2:D, B2:B,E15)`
    1.  `=MINIFS(D2:D, B2:B,E16)`
    1.  `=MINIFS(D2:D, B2:B,E17)`
    1.  `=MINIFS(D2:D, B2:B,E18)`
    1.  `=MINIFS(D2:D, B2:B,E19)`
    1.  `=MINIFS(D2:D, B2:B,E20)`
    1.  `=MINIFS(D2:D, B2:B,E21)`
    1.  `=MINIFS(D2:D, B2:B,E22)`
    1.  `=MINIFS(D2:D, B2:B,E23)`
1.  Maximum Job Duration - In cell `G2` paste the following, deleting/adding as necessary:
    1.  `=MAXIFS(D2:D, B2:B,E2)`
    1.  `=MAXIFS(D2:D, B2:B,E3)`
    1.  `=MAXIFS(D2:D, B2:B,E4)`
    1.  `=MAXIFS(D2:D, B2:B,E5)`
    1.  `=MAXIFS(D2:D, B2:B,E6)`
    1.  `=MAXIFS(D2:D, B2:B,E7)`
    1.  `=MAXIFS(D2:D, B2:B,E8)`
    1.  `=MAXIFS(D2:D, B2:B,E9)`
    1.  `=MAXIFS(D2:D, B2:B,E10)`
    1.  `=MAXIFS(D2:D, B2:B,E11)`
    1.  `=MAXIFS(D2:D, B2:B,E12)`
    1.  `=MAXIFS(D2:D, B2:B,E13)`
    1.  `=MAXIFS(D2:D, B2:B,E14)`
    1.  `=MAXIFS(D2:D, B2:B,E15)`
    1.  `=MAXIFS(D2:D, B2:B,E16)`
    1.  `=MAXIFS(D2:D, B2:B,E17)`
    1.  `=MAXIFS(D2:D, B2:B,E18)`
    1.  `=MAXIFS(D2:D, B2:B,E19)`
    1.  `=MAXIFS(D2:D, B2:B,E20)`
    1.  `=MAXIFS(D2:D, B2:B,E21)`
    1.  `=MAXIFS(D2:D, B2:B,E22)`
    1.  `=MAXIFS(D2:D, B2:B,E23)`
1.  Average Job Duration - In cell `H2` paste the following, deleting/adding as necessary:
    1.  `=AVERAGEIFS(D2:D, B2:B,E2)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E3)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E4)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E5)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E6)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E7)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E8)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E9)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E10)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E11)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E12)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E13)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E14)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E15)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E16)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E17)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E18)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E19)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E20)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E21)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E22)`
    1.  `=AVERAGEIFS(D2:D, B2:B,E23)`
1.  Job Count - In cell `I2` paste the following, deleting/adding as necessary:
    1.  `=COUNTIFS(B2:B, E2)`
    1.  `=COUNTIFS(B2:B, E3)`
    1.  `=COUNTIFS(B2:B, E4)`
    1.  `=COUNTIFS(B2:B, E5)`
    1.  `=COUNTIFS(B2:B, E6)`
    1.  `=COUNTIFS(B2:B, E7)`
    1.  `=COUNTIFS(B2:B, E8)`
    1.  `=COUNTIFS(B2:B, E9)`
    1.  `=COUNTIFS(B2:B, E10)`
    1.  `=COUNTIFS(B2:B, E11)`
    1.  `=COUNTIFS(B2:B, E12)`
    1.  `=COUNTIFS(B2:B, E13)`
    1.  `=COUNTIFS(B2:B, E14)`
    1.  `=COUNTIFS(B2:B, E15)`
    1.  `=COUNTIFS(B2:B, E16)`
    1.  `=COUNTIFS(B2:B, E17)`
    1.  `=COUNTIFS(B2:B, E18)`
    1.  `=COUNTIFS(B2:B, E19)`
    1.  `=COUNTIFS(B2:B, E20)`
    1.  `=COUNTIFS(B2:B, E21)`
    1.  `=COUNTIFS(B2:B, E22)`
    1.  `=COUNTIFS(B2:B, E23)`