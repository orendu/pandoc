# Generate PDF from MD

Usage of `/generate.sh` script:
```
/generate.sh <working directory> <input md file> <output pdf file> <CSS file> <Document title>
```

Example:
``` bash
/generate.sh doc doc.md doc.pdf css/archdoc.css "Example Document"
```

Running the container:
``` bash
docker run --rm -v "`pwd`":/github/workspace orendu/pandoc /generate.sh . md_cheatsheet.md md_cheatsheet css/archdoc.css "MarkDown CheatSheet"
```



