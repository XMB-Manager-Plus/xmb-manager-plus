
    Simple Search and Replace Command Line Tool
    -------------------------------------------

    Sometimes you just need a very simple tool to search 
    and replace text in text files. This is such a tool. 

    It is built to be used in batch files so it uses a 
    simple method to replace quotation marks (") for the 
    text arguments. 

    Normally one wold use a tool like sed for the job. While 
    such a power tool can be used, it often requires escaping 
    many characters and can be difficult to work with if you 
    need to replace long lines of text.


    SIMPLE SEARCH AND REPLACE OPTIONS

    Basic Options:
      -h [ --help ] arg        Option help (use with "all" or "options" arguments)
      -f [ --file ] arg        Input file
      -o [ --output ] arg      Output file
      -s [ --search ] arg      Search text
      -r [ --replace ] arg     Replacement text
      -n [ --occurrence ] arg  Occurrence to replace
      -i [ --ignore-case ]     Ignore case for the search
      -c [ --case-sensitive ]  Use a case sensitive search
      -a [ --alter ]           Alter original input file

    File Scan Options:
      -D [ --dir ] arg        Search directory
      -I [ --include ] arg    Include files matching the wildcard specification
      -X [ --ext ] arg        Output file extension
      -R [ --recurse ]        Read all files under each directory, recursively
      -O [ --output-dir ] arg Output directory

    Advanced Options:
      -e [ --encoding ] arg File encoding (ansi,utf8,utf16le,utf16be,auto)
      --nobackup            Supress backup of input file
      --return-count        Return the number of replacements made
      --options arg         Options file

      Use '' to represent " in search and replace text.
      Use /SSR_QUOTE/ to represent ' in search and replace text.
      Use /SSR_CR/ to represent a carriage return in search and replace text.
      Use /SSR_LF/ to represent a line feed in search and replace text.
      Use /SSR_TAB/ to represent a tab in search and replace text.
      Use /u1234/ to represent any unicode character in search and replace text.

    OPTIONS FILE

    You can provide search and replace options via an options file. 
    This allows you bypass the restrictions of the command line parser.

    You can include the following options in an options file:

      -s [ --search ] arg      Search text
      -r [ --replace ] arg     Replacement text
      -n [ --occurrence ] arg  Occurrence to replace
      -i [ --ignore-case ]     Ignore case for the search
      -c [ --case-sensitive ]  Use a case sensitive search
      
    The search and replace text may be delimited in various ways:

      --search(sample text)  -s[sample text] -s<sample text> -s{sample text}
      --replace|sample text| -r#sample text# -r~sample text~ -r:sample text:
      --search?sample text?  (where ? can be any printable character)
      
      Use /SSR_CR/ to represent a carriage return in search and replace text.
      Use /SSR_LF/ to represent a line feed in search and replace text.
      Use /SSR_TAB/ to represent a tab in search and replace text.
      Use /u1234/ to represent any unicode character in search and replace text.



    Author: Ross MacGregor
    License: Freeware, Unrestricted Use


    HISTORY

    Version 2.2: Oct 28, 2011
      - added file scan support
      - split options into categories
      - fixed case insensitive bug

    Version 2.1: June 20, 2011
      - Fixed problem with matching some patterns.
      - Added a new option to return number of replacements made instead
	    of an error code.

    Version 2.0: April 21, 2011
      - Initial release
